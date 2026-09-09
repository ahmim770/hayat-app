import SwiftUI
import Combine

// Appearance options for the app
enum AppAppearance: String, Codable, CaseIterable, Identifiable {
    case system
    case light
    case dark

    var id: String { rawValue }
    
    var localizedTitle: String {
        switch self {
        case .system: return "Follow System"
        case .light: return "Light"
        case .dark: return "Dark"
        }
    }
}

@MainActor
class AppState: ObservableObject {
    @Published var isLoggedIn: Bool = false
    @Published var username: String = "" {
        didSet {
            UserDefaults.standard.set(username, forKey: "username")
        }
    }
    @Published var language: AppLanguage = .english {
        didSet {
            UserDefaults.standard.set(language.rawValue, forKey: "language")
        }
    }
    @Published var pharmacies: [Pharmacy] = []
    
    // Settings
    @Published var isDarkMode: Bool = false {
        didSet {
            UserDefaults.standard.set(isDarkMode, forKey: "isDarkMode")
        }
    }
    
    @Published var selectedTab: Int = 0
    @Published var appAppearance: AppAppearance = .system {
        didSet {
            UserDefaults.standard.set(appAppearance.rawValue, forKey: "appAppearance")
        }
    }
    
    // Computed Color Scheme
    var colorScheme: ColorScheme? {
        switch appAppearance {
        case .system: return nil
        case .light: return .light
        case .dark: return .dark
        }
    }
    
    // Health Records
    @Published var allergies: [Allergy] = [] {
        didSet {
            if let encoded = try? JSONEncoder().encode(allergies) {
                UserDefaults.standard.set(encoded, forKey: "allergies")
            }
        }
    }
    @Published var insurance: Insurance? {
        didSet {
            if let encoded = try? JSONEncoder().encode(insurance) {
                UserDefaults.standard.set(encoded, forKey: "insurance")
            } else {
                UserDefaults.standard.removeObject(forKey: "insurance")
            }
        }
    }

    @Published var medications: [Medication] = [] {
        didSet {
            if let encoded = try? JSONEncoder().encode(medications) {
                UserDefaults.standard.set(encoded, forKey: "medications")
            }
            Task {
                await MedicationReminderManager.shared.syncNotifications(for: medications)
            }
        }
    }

    // Weather Data
    @Published var temperature: String = "--"
    @Published var weatherCondition: String = "Loading..."
    
    init() {
        // Load persistent data
        self.username = UserDefaults.standard.string(forKey: "username") ?? ""
        self.isDarkMode = UserDefaults.standard.bool(forKey: "isDarkMode")
        
        if let appearanceString = UserDefaults.standard.string(forKey: "appAppearance"),
           let savedAppearance = AppAppearance(rawValue: appearanceString) {
            self.appAppearance = savedAppearance
        }
        
        if let languageString = UserDefaults.standard.string(forKey: "language"),
           let savedLanguage = AppLanguage(rawValue: languageString) {
            self.language = savedLanguage
        }
        
        if let insuranceData = UserDefaults.standard.data(forKey: "insurance"),
           let decodedInsurance = try? JSONDecoder().decode(Insurance.self, from: insuranceData) {
            self.insurance = decodedInsurance
        }
        
        if let allergiesData = UserDefaults.standard.data(forKey: "allergies"),
           let decodedAllergies = try? JSONDecoder().decode([Allergy].self, from: allergiesData) {
            self.allergies = decodedAllergies
        }
        
        if let medicationsData = UserDefaults.standard.data(forKey: "medications"),
           let decodedMedications = try? JSONDecoder().decode([Medication].self, from: medicationsData) {
            self.medications = decodedMedications
        }
        
        // Determine login status based on username
        self.isLoggedIn = !username.isEmpty
        
        pharmacies = PharmacyData.pharmacies
        Task {
            await MedicationReminderManager.shared.syncNotifications(for: medications)
            await fetchWeather()
        }
    }
    
    // Localization Helper
    private static let arabicDictionary: [String: String] = [
        "Home": "الرئيسية",
        "Appointments": "المواعيد",
        "Emergency": "الطوارئ",
        "Profile": "الملف الشخصي",
        "Welcome back,": "مرحباً بك،",
        "Search for doctor, specialty...": "ابحث عن طبيب، تخصص...",
        "Weather Today": "الطقس اليوم",
        "Next Appointment": "الموعد القادم",
        "No upcoming appointments": "لا توجد مواعيد قادمة",
        
        "Explore Services": "استكشف الخدمات",
        "Hospitals": "المستشفيات",
        "Pharmacy": "الصيدلية",
        "Doctors": "الأطباء",
        "Language": "اللغة",
        "Privacy & Security": "الخصوصية والأمان",
        "Help & Support": "المساعدة والدعم",
        "Log Out": "تسجيل الخروج",
        "Health Records": "السجلات الصحية",
        "Radiology Results": "نتائج الأشعة",
        "Medical Reports": "التقارير الطبية",
        "Allergies": "الحساسية",
        "Allergies List": "قائمة الحساسية",
        "Insurance Card": "بطاقة التأمين",
        "Access All Records": "الوصول إلى جميع السجلات",
        "Unified View": "عرض موحد",
        "Hospital": "المستشفى",
        "Findings": "النتائج",
        "Normal structure. No abnormalities detected.": "الهيكل طبيعي. لم يتم اكتشاف أي تشوهات.",
        "Status": "الحالة",
        "Patient": "المريض",
        "Summary": "الملخص",
        "Doctor": "الطبيب",
        "Delete Allergy": "حذف الحساسية",
        "Delete Allergy?": "حذف الحساسية؟",
        "Are you sure you want to delete this allergy?": "هل أنت متأكد أنك تريد حذف هذه الحساسية؟",
        "Sort": "ترتيب",
        "Sort By": "ترتيب حسب",
        "Highest Rated": "الأعلى تقييماً",
        "Lowest Rated": "الأقل تقييماً",
        "Name": "الاسم",
        "Reaction": "رد الفعل",
        "Notes": "ملاحظات",
        "Search hospitals": "البحث عن مستشفيات",
        "Avoid exposure. Carry Epipen if recommended.": "تجنب التعرض. احمل قلم الإبينفرين إذا أوصى بذلك.",
        "Policy Number": "رقم البوليصة",
        "Member ID": "رقم العضوية",
        "Expires": "تاريخ الانتهاء",
        "Update Insurance": "تحديث التأمين",
        "No Insurance Data": "لا توجد بيانات تأمين",
        "Result Value": "قيمة النتيجة",
        "Prescribed by": "وصف من قبل",
        "End Date": "تاريخ الانتهاء",
        "Book Appointment": "حجز موعد",
        "Cancel": "إلغاء",
        "Confirm": "تأكيد",
        "Select Date": "اختر التاريخ",
        "Available Time": "الوقت المتاح",
        "Appointment Type": "نوع الموعد",
        "Online Consultation": "استشارة عبر الإنترنت",
        "In-Clinic Visit": "زيارة للعيادة",
        "Yes": "نعم",
        "No": "لا",
        "Enter Insurance ID (9 digits)": "أدخل رقم التأمين (9 أرقام)",
        "Insurance discount applied": "تم تطبيق خصم التأمين",
        "Do you have insurance?": "هل لديك تأمين؟",
        "Consultation Fee:": "رسوم الاستشارة:",
        "My Appointments": "مواعيدي",
        "Reschedule": "إعادة جدولة",
        "Call Doctor": "اتصل بالطبيب",
        "Cancel Appointment": "إلغاء الموعد",
        "Login with Nafath": "تسجيل الدخول عبر نفاذ",
        "Enter your name": "أدخل اسمك",
        "Login": "دخول",
        "Find a doctor and book your first appointment.": "ابحث عن طبيب واحجز موعدك الأول.",
        "Riyadh": "الرياض",
        "Pharmacy Feature Coming Soon": "خدمة الصيدلية قادمة قريباً",
        "Book your first checkup": "احجز فحصك الأول",
        "Find Care": "ابحث عن رعاية",
        "Recent Health Updates": "آخر التحديثات الصحية",
        "Guest": "ضيف",
        "Years": "سنوات",
        "Patients": "مرضى",
        "Rating": "تقييم",
        "About": "نبذة",
        "Education": "التعليم",
        "Languages": "اللغات",
        "Go to My Appointments": "الذهاب إلى مواعيدي",
        "Medications": "الأدوية",
        "Booking Confirmed": "تم تأكيد الحجز",
        "Your appointment with": "موعدك مع",
        "has been scheduled for": "تم تحديده في",
        "at": "الساعة",
        "Done": "تم",
        "SAR": "ريال",
        "Report Details": "تفاصيل التقرير",
        "Allergy Details": "تفاصيل الحساسية",
        "Radiology Details": "تفاصيل الأشعة",
        "Date": "التاريخ",
        "Riyadh, Saudi Arabia": "الرياض، المملكة العربية السعودية",
        "By logging in, you agree to our Terms & Privacy Policy": "بتسجيل الدخول، أنت توافق على الشروط وسياسة الخصوصية",
        "Please sign in to continue": "الرجاء تسجيل الدخول للمتابعة",
        "Welcome Back": "مرحباً بعودتك",
        "In case of emergency": "في حالة الطوارئ",
        "Help is one tap away": "المساعدة على بعد ضغطة زر",
        "CALL 911": "اتصل بـ 911",
        "Universal Emergency": "الطوارئ العامة",
        "Other Services": "خدمات أخرى",
        "MoH Health": "وزارة الصحة",
        "Police": "الشرطة",
        "Traffic Police": "المرور",
        "Saudi Red Crescent": "الهلال الأحمر السعودي",
        "Civil Defense": "الدفاع المدني",
        "Go to Hospital": "الذهاب للمستشفى",
        "Appointment Details": "تفاصيل الموعد",
        "Reschedule Appointment": "إعادة جدولة الموعد",
        "Select New Date": "اختر موعداً جديداً",
        "Confirm New Date": "تأكيد الموعد الجديد",
        "Date & Time": "التاريخ والوقت",
        "Available Doctors": "الأطباء المتاحين",
        "No doctors listed for this hospital yet.": "لا يوجد أطباء مدرجين لهذا المستشفى حتى الآن.",
        "Hospital Details": "تفاصيل المستشفى",
        "Swipe to Call 911": "اسحب للاتصال بـ 911",
        "Help is on the way": "المساعدة في الطريق",
        "Not too far to arrive": "ليس بعيداً للوصول",
        "Connecting to emergency services": "جاري الاتصال بخدمات الطوارئ",
        "Ambulance": "إسعاف",
        "Dark Mode": "الوضع الداكن",
        "Light Mode": "الوضع الفاتح",
        "Accessibility": "سهولة الاستخدام",
        "App Version": "نسخة التطبيق",
        "About Morafiq": "عن مرافق",
        "Privacy & Data Usage": "الخصوصية واستخدام البيانات",
        "Made with": "صنع بـ",
        "in Riyadh": "في الرياض",
        "General": "عام",
        "Account": "الحساب",
        "Preferences": "التفضيلات",
        "Virtual Care": "رعاية افتراضية",
        "Share Real Location": "مشاركة الموقع الفعلي",
        "Location Permission Required": "مطلوب إذن الموقع",
        "Settings": "الإعدادات",
        "Please enable location services in Settings to share your real location with Morafiq.": "يرجى تمكين خدمات الموقع في الإعدادات لمشاركة موقعك الحقيقي مع مرافق.",
        "Shared my location": "شاركت موقعي",
        "I have received your location. This will help me find the nearest medical assistance in the future.": "لقد تلقيت موقعك. سيساعدني هذا في العثور على أقرب مساعدة طبية في المستقبل.",
        "Thank you for sharing your message. I am in UI-only mode for now, but I will be able to help you soon!": "شكرًا لك على مشاركة رسالتك. أنا في وضع واجهة المستخدم فقط في الوقت الحالي، لكنني سأتمكن من مساعدتك قريبًا!",
        "Insurance Active": "التأمين نشط",
        "Insurance Information": "معلومات التأمين",
        "Provider": "المزود",
        "Membership": "العضوية",
        "Remove Insurance": "إزالة التأمين",
        "Save Insurance": "حفظ التأمين",
        "Enter 9-digit Insurance ID": "أدخل رقم التأمين (9 أرقام)",
        "ID must be exactly 9 digits": "يجب أن يكون الرقم 9 أرقام بالضبط",
        "Membership tier determines your appointment discounts.": "فئة العضوية تحدد الخصومات على المواعيد.",
        "Insurance Settings": "إعدادات التأمين",
        "Open in Google Maps": "فتح في خرائط جوجل",
        "Dosage": "الجرعة",
        "Frequency": "التكرار",
        "Find Pharmacy": "البحث عن صيدلية",
        "App Appearance": "مظهر التطبيق",
        "Follow System": "حسب النظام",
        "Light": "فاتح",
        "Dark": "داكن",
        "Contact Support": "اتصل بالدعم",
        "Add Medication": "إضافة دواء",
        "Medication Details": "تفاصيل الدواء",
        "Medication Name": "اسم الدواء",
        "Start Date": "تاريخ البدء",
        "Duration": "المدة",
        "1 Week": "أسبوع واحد",
        "2 Weeks": "أسبوعين",
        "1 Month": "شهر واحد",
        "2 Months": "شهرين",
        "Custom": "مخصص",
        "Treatment Progress": "تقدم العلاج",
        "Days Left": "الأيام المتبقية",
        "No Medications": "لا توجد أدوية",
        "Add your medications to track them easily.": "أضف أدويتك لتتبعها بسهولة.",
        "Remind me to take this medication": "ذكرني بتناول هذا الدواء",
        "Reminder Options": "خيارات التذكير",
        "First Reminder Time": "وقت أول تذكير",
        "How many times a day": "كم مرة في اليوم",
        "times per day": "مرات في اليوم",
        "You will be reminded": "سيتم تذكيرك",
        "starting at": "ابتداءً من",
        "Reminders": "التذكيرات",
        "Reminders Enabled": "التذكيرات مفعلة",
        "Reminder Time": "وقت التذكير",
        "Reminder Frequency": "تكرار التذكير",
        "Enabled": "مفعل",
        "Disabled": "غير مفعل",
        "Notifications Disabled": "الإشعارات معطلة",
        "Please allow notifications in Settings to receive medication reminders.": "يرجى السماح بالإشعارات من الإعدادات لتلقي تذكيرات الأدوية.",
        "Open Settings": "فتح الإعدادات",
        "Medication Reminder": "تذكير الدواء",
        "Completed": "مكتمل",
        "Delete Medication": "حذف الدواء",
        "Delete Medication?": "حذف الدواء؟",
        "Are you sure you want to remove this medication?": "هل أنت متأكد أنك تريد حذف هذا الدواء؟",
        "Defined Care": "الرعاية المحددة",
        "Morafiq – Medical Assistant": "مرافق – المساعد الطبي",
        "Ask about symptoms, hospitals, doctors.": "اسأل عن الأعراض، المستشفيات، الأطباء.",
        "Morafiq AI": "ذكاء مرافق",
        "Hello! I am Morafiq, your medical assistant. How can I help you today?": "مرحباً! أنا مرافق، مساعدك الطبي. كيف يمكنني مساعدتك اليوم؟",
        "Type your message...": "اكتب رسالتك...",
        "Continue": "متابعة",
        "Agree and Continue": "أوافق وأتابع",
        "Morafiq": "مرافق",
        "Morafiq Notice": "إشعار مرافق",
        "Messages you type in Morafiq (including any text you enter) will be transmitted to a third-party AI service (OpenAI) to generate responses.\n\nDo not share sensitive or medical data.\n\nDo you agree to continue?": "سيتم نقل الرسائل التي تكتبها في مرافق (بما في ذلك أي نص تدخله) إلى خدمة ذكاء اصطناعي تابعة لجهة خارجية (OpenAI) لتوليد الردود.\n\nلا تشارك بيانات حساسة أو طبية.\n\nهل توافق على المتابعة؟",
        "Messages you type in Morafiq are processed by a third-party AI service (OpenAI). Do not share sensitive personal or medical information.": "تتم معالجة الرسائل التي تكتبها في مرافق بواسطة خدمة ذكاء اصطناعي تابعة لجهة خارجية (OpenAI). لا تشارك معلومات شخصية أو طبية حساسة.",
        "Privacy Policy": "سياسة الخصوصية",
        "Hayat protects your privacy and uses your information only to provide and improve healthcare features inside the app.": "يحمي تطبيق حيات خصوصيتك ويستخدم معلوماتك فقط لتقديم وتحسين الميزات الصحية داخل التطبيق.",
        "Morafiq AI Disclosure": "إفصاح مرافق الذكي",
        "Data We Use": "البيانات التي نستخدمها",
        "Hayat may store your profile details, app preferences, health records you enter, and Morafiq consent choice on your device to keep the app working properly.": "قد يخزن تطبيق حيات تفاصيل ملفك الشخصي وتفضيلات التطبيق والسجلات الصحية التي تدخلها واختيار موافقتك على مرافق على جهازك لضمان عمل التطبيق بشكل صحيح.",
        "Your Choices": "خياراتك",
        "You can stop using Morafiq at any time, avoid sharing sensitive information, and review this privacy notice from your profile whenever needed.": "يمكنك التوقف عن استخدام مرافق في أي وقت وتجنب مشاركة المعلومات الحساسة ومراجعة إشعار الخصوصية هذا من ملفك الشخصي عند الحاجة.",
        "The app collects user-provided text input entered into the Morafiq chat. This data is transmitted securely to a third-party AI provider (OpenAI) to generate responses and is not stored by the app.": "يجمع التطبيق النص الذي يدخله المستخدم داخل محادثة مرافق. يتم نقل هذه البيانات بشكل آمن إلى مزود ذكاء اصطناعي تابع لجهة خارجية (OpenAI) لتوليد الردود ولا يتم تخزينها بواسطة التطبيق.",
        "Get directions": "الحصول على الاتجاهات",
        "Open in Apple Maps": "فتح في خرائط آبل",
        "Logout Confirmation": "تأكيد تسجيل الخروج",
        "Are you sure you want to log out? This will clear all local data on this device.": "هل أنت متأكد أنك تريد تسجيل الخروج؟ سيؤدي ذلك إلى مسح جميع البيانات المحلية على هذا الجهاز.",
        "Leave Conversation?": "مغادرة المحادثة؟",
        "If you leave this page, you will not be able to return to this conversation.": "إذا غادرت هذه الصفحة، فلن تتمكن من العودة إلى هذه المحادثة.",
        "Stay": "بقاء",
        "Leave": "مغادرة",
        "Go to Doctor": "الذهاب إلى الطبيب",
        "Call Hospital": "اتصل بالمستشفى"
    ]

    func localized(_ key: String) -> String {
        if isArabicActive {
            return AppState.arabicDictionary[key] ?? key
        } else {
            return key
        }
    }

    func localizedDoctorName(_ name: String) -> String {
        localizedDirectoryName(name, localizedArabicNames: LocalizedNameData.doctorNamesArabic)
    }

    func localizedDoctorIntro(for doctor: Doctor) -> String {
        if isArabicActive {
            return LocalizedNameData.doctorIntrosArabic[doctor.name] ?? doctor.intro
        }
        return doctor.intro
    }

    func localizedHospitalName(_ name: String) -> String {
        localizedDirectoryName(name, localizedArabicNames: LocalizedNameData.hospitalNamesArabic)
    }

    func localizedPharmacyName(_ name: String) -> String {
        localizedDirectoryName(name, localizedArabicNames: LocalizedNameData.pharmacyNamesArabic)
    }

    private var isArabicActive: Bool {
        let currentLanguage = UserDefaults.standard.string(forKey: "language")
        return currentLanguage == AppLanguage.arabic.rawValue || language == .arabic
    }

    private func localizedDirectoryName(_ name: String, localizedArabicNames: [String: String]) -> String {
        let cleanedName = name
            .replacingOccurrences(of: "\t", with: " ")
            .split(separator: " ")
            .joined(separator: " ")
            .trimmingCharacters(in: .whitespacesAndNewlines)

        guard isArabicActive else { return cleanedName }
        return localizedArabicNames[cleanedName] ?? cleanedName
    }

    func logout() {
        username = ""
        isLoggedIn = false
        allergies = []
        medications = []
        insurance = nil
        selectedTab = 0
        pharmacies = PharmacyData.pharmacies

        let keysToRemove = [
            "username",
            "allergies",
            "medications",
            "insurance",
            "morafiqConsentAccepted",
            "userId"
        ]

        for key in keysToRemove {
            UserDefaults.standard.removeObject(forKey: key)
        }

        UserDefaults.standard.synchronize()
    }
    
    func fetchWeather() async {
        guard let url = URL(string: "https://api.open-meteo.com/v1/forecast?latitude=24.7136&longitude=46.6753&current_weather=true") else { return }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let response = try JSONDecoder().decode(WeatherResponse.self, from: data)
            
            self.temperature = "\(Int(response.current_weather.temperature))°C"
            self.weatherCondition = self.getWeatherIcon(code: response.current_weather.weathercode)
        } catch {
            print("Error fetching weather: \(error)")
        }
    }
    
    private func getWeatherIcon(code: Int) -> String {
        switch code {
        case 0: return "sun.max.fill"
        case 1...3: return "cloud.sun.fill"
        case 45, 48: return "cloud.fog.fill"
        case 51...67: return "cloud.rain.fill"
        case 71...77: return "cloud.snow.fill"
        case 95...99: return "cloud.bolt.fill"
        default: return "sun.max.fill"
        }
    }
    
    private func addDummyData() {
        pharmacies = PharmacyData.pharmacies
    }
}

// Weather Models
struct WeatherResponse: Codable {
    let current_weather: CurrentWeather
}

struct CurrentWeather: Codable {
    let temperature: Double
    let weathercode: Int
}
