
import Foundation

struct DoctorData {
    private static let rawDoctors: [Doctor] = [
        Doctor(
            name: "Dr. Saad Al-Shamrani",
            specialty: "Consultant Ophthalmology",
            hospital: "Saudi German Hospital",
            intro: "Consultant Ophthalmologist with over 26 years of experience in diagnosing and managing eye diseases. Extensive experience in cataract surgery and long-term vision care.",
            rating: 3.9,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 18,
            patientsServed: 6700
        ),

        Doctor(
            name: "Dr. Basim Saleh Alsaywid",
            specialty: "Consultant Pediatrics",
            hospital: "Saudi German Hospital",
            intro: "Consultant Pediatric Urologist with 14+ years treating congenital and acquired urological conditions. Known for a compassionate approach to child healthcare and family guidance.",
            rating: 4.0,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 22,
            patientsServed: 4900
        ),

        Doctor(
            name: "Dr. Abdulrahman Mohammed Alrajhi",
            specialty: "Consultant Pediatrics",
            hospital: "Saudi German Hospital",
            intro: "Senior Registrar in Orthopedic Surgery specializing in pediatric orthopedic conditions. Known for a compassionate approach to child healthcare and family guidance.",
            rating: 4.0,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 17,
            patientsServed: 4150
        ),

        Doctor(
            name: "Prof. Fahad Abdullah Alwadaani",
            specialty: "Consultant Ophthalmology",
            hospital: "Saudi German Hospital",
            intro: "Distinguished ophthalmologist with 25+ years’ experience in adult and pediatric eye care. Extensive experience in cataract surgery and long-term vision care.",
            rating: 3.5,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 18,
            patientsServed: 7100
        ),

        Doctor(
            name: "Dr. Riyam Alanazi",
            specialty: "Consultant Pediatrics",
            hospital: "Saudi German Hospital",
            intro: "Consultant Pediatric Neurologist & Epileptologist with a decade of experience in children’s neurological disorders. Known for a compassionate approach to child healthcare and family guidance.",
            rating: 3.7,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 16,
            patientsServed: 3900
        ),

        Doctor(
            name: "Dr. Rasha Alyafrsi",
            specialty: "Consultant Dermatology",
            hospital: "Saudi German Hospital",
            intro: "Senior Registrar Dermatologist experienced in medical and aesthetic dermatology. Has helped hundreds of patients successfully manage acne, eczema, and chronic skin conditions.",
            rating: 4.5,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 13,
            patientsServed: 4150
        ),

        Doctor(
            name: "Dr. Tariq AlAsbali",
            specialty: "Consultant Ophthalmology",
            hospital: "Saudi German Hospital",
            intro: "Senior Consultant Ophthalmologist with advanced expertise in cataract and glaucoma procedures. Extensive experience in cataract surgery and long-term vision care.",
            rating: 4.0,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 20,
            patientsServed: 5400
        ),

        Doctor(
            name: "Dr. Ghaith Almidani",
            specialty: "Consultant Cardiology",
            hospital: "Saudi German Hospital",
            intro: "Consultant Electrophysiologist with board certifications in cardiology and electrophysiology. Expert in cardiovascular health and preventive heart care.",
            rating: 4.5,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 16,
            patientsServed: 3750
        ),

        Doctor(
            name: "Dr. Khalid AlKadam",
            specialty: "Consultant General Surgery",
            hospital: "Saudi German Hospital",
            intro: "Consultant Bariatric & Laparoscopic Surgeon specializing in advanced minimally invasive procedures. Performed numerous successful procedures with a focus on patient safety and recovery.",
            rating: 4.4,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 10,
            patientsServed: 3900
        ),

        Doctor(
            name: "Dr. Kanan Alshammari",
            specialty: "Consultant Oncology",
            hospital: "Saudi German Hospital",
            intro: "Consultant Medical Oncologist with specialized training in GI cancers and rare sarcomas. Dedicated to providing advanced cancer care and support.",
            rating: 4.6,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 19,
            patientsServed: 5550
        ),

        Doctor(
            name: "Dr. Yahya Ahmad Alzahrani",
            specialty: "Consultant Ophthalmology",
            hospital: "Saudi German Hospital",
            intro: "Board-certified Consultant Ophthalmologist focused on medical and surgical retina care. Extensive experience in cataract surgery and long-term vision care.",
            rating: 4.1,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 11,
            patientsServed: 2500
        ),

        Doctor(
            name: "Dr. Ahmad Mohammed Ahmad Ibrahim",
            specialty: "Consultant Orthopedics",
            hospital: "Saudi German Hospital",
            intro: "Orthopedic surgeon specializing in sports injuries, arthroscopy, and fracture fixation with 20+ years’ experience. Specializing in musculoskeletal health and recovery from sports injuries.",
            rating: 4.5,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 14,
            patientsServed: 5600
        ),

        Doctor(
            name: "Dr. Ilham Lakhdar",
            specialty: "Consultant Psychiatry",
            hospital: "Saudi German Hospital",
            intro: "Senior Registrar in General Psychiatry with 18+ years in psychiatric diagnosis and care. Committed to mental wellness and personalized therapeutic plans.",
            rating: 4.5,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 12,
            patientsServed: 3400
        ),

        Doctor(
            name: "Dr. Hisham Alkhunaizan",
            specialty: "Consultant Family Medicine",
            hospital: "Saudi German Hospital",
            intro: "Senior Registrar in Family Medicine delivering patient-centered comprehensive care. Focused on comprehensive health management for the whole family.",
            rating: 3.8,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 16,
            patientsServed: 4550
        ),

        Doctor(
            name: "Dr. Nada Alabdulkarim",
            specialty: "Consultant Pediatrics",
            hospital: "Saudi German Hospital",
            intro: "Consultant Pediatric Pulmonologist experienced in diagnosing and treating childhood respiratory conditions. Known for a compassionate approach to child healthcare and family guidance.",
            rating: 4.3,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 11,
            patientsServed: 3150
        ),

        Doctor(
            name: "Dr. Harold G. Esparcia",
            specialty: "Consultant Internal Medicine",
            hospital: "KIMSHEALTH Medical Center (Jarir)",
            intro: "Physician providing general clinical care. Expertise in managing chronic diseases and complex medical conditions.",
            rating: 4.9,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 12,
            patientsServed: 3100
        ),

        Doctor(
            name: "Dr. Jasmine Abdulkhadar Hashir",
            specialty: "Consultant Internal Medicine",
            hospital: "KIMSHEALTH Medical Center (Jarir)",
            intro: "Physician providing outpatient assessment and treatment. Expertise in managing chronic diseases and complex medical conditions.",
            rating: 3.5,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 18,
            patientsServed: 5850
        ),

        Doctor(
            name: "Dr. Jasneer NP",
            specialty: "General Practitioner",
            hospital: "KIMSHEALTH Medical Center (Jarir)",
            intro: "Clinician providing routine consultations and follow-ups. Dedicated to primary care and patient wellness.",
            rating: 4.5,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 6,
            patientsServed: 2500
        ),

        Doctor(
            name: "Dr. Jerry John Oommen",
            specialty: "Consultant Internal Medicine",
            hospital: "KIMSHEALTH Medical Center (Jarir)",
            intro: "Physician providing general medical consultations. Expertise in managing chronic diseases and complex medical conditions.",
            rating: 4.5,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 10,
            patientsServed: 2850
        ),

        Doctor(
            name: "Dr. Mahmoud Samir Elkot",
            specialty: "Consultant Internal Medicine",
            hospital: "KIMSHEALTH Medical Center (Jarir)",
            intro: "Physician providing diagnosis and treatment planning. Expertise in managing chronic diseases and complex medical conditions.",
            rating: 4.4,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 10,
            patientsServed: 2550
        ),

        Doctor(
            name: "Dr. Mohammed Umer",
            specialty: "Consultant ENT",
            hospital: "KIMSHEALTH Medical Center (Jarir)",
            intro: "Clinician providing general outpatient care. Specializing in conditions affecting the ear, nose, and throat.",
            rating: 4.5,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 20,
            patientsServed: 5650
        ),

        Doctor(
            name: "Dr. Monalisa G David",
            specialty: "Consultant Internal Medicine",
            hospital: "KIMSHEALTH Medical Center (Jarir)",
            intro: "Physician providing consultations and continuity care. Expertise in managing chronic diseases and complex medical conditions.",
            rating: 3.5,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 11,
            patientsServed: 3900
        ),

        Doctor(
            name: "Dr. Muhammad Usman Ulhaq",
            specialty: "Consultant Internal Medicine",
            hospital: "KIMSHEALTH Medical Center (Jarir)",
            intro: "Physician providing evaluation and treatment of common conditions. Expertise in managing chronic diseases and complex medical conditions.",
            rating: 3.8,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 11,
            patientsServed: 4450
        ),

        Doctor(
            name: "Dr. Muhammad Usman Ghani",
            specialty: "Consultant ENT",
            hospital: "KIMSHEALTH Medical Center (Jarir)",
            intro: "Clinician providing outpatient diagnosis and management. Specializing in conditions affecting the ear, nose, and throat.",
            rating: 3.8,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 22,
            patientsServed: 5000
        ),

        Doctor(
            name: "Dr. Naga Lakshmi V",
            specialty: "Consultant Internal Medicine",
            hospital: "KIMSHEALTH Medical Center (Jarir)",
            intro: "Physician providing routine and follow-up care. Expertise in managing chronic diseases and complex medical conditions.",
            rating: 4.4,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 13,
            patientsServed: 4000
        ),

        Doctor(
            name: "Mrs Rahat Haseeb",
            specialty: "Consultant ENT",
            hospital: "KIMSHEALTH Medical Center (Jarir)",
            intro: "Healthcare provider supporting patient assessment and care. Specializing in conditions affecting the ear, nose, and throat.",
            rating: 4.4,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 11,
            patientsServed: 4450
        ),

        Doctor(
            name: "Dr. Rida Malik",
            specialty: "Consultant Internal Medicine",
            hospital: "KIMSHEALTH Medical Center (Jarir)",
            intro: "Physician providing general consultations and care plans. Expertise in managing chronic diseases and complex medical conditions.",
            rating: 3.6,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 20,
            patientsServed: 6700
        ),

        Doctor(
            name: "Dr. Riffat Ara",
            specialty: "Consultant ENT",
            hospital: "KIMSHEALTH Medical Center (Jarir)",
            intro: "Clinician providing diagnosis and outpatient management. Specializing in conditions affecting the ear, nose, and throat.",
            rating: 4.3,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 14,
            patientsServed: 4000
        ),

        Doctor(
            name: "Dr. Rini Mathews",
            specialty: "Consultant Internal Medicine",
            hospital: "KIMSHEALTH Medical Center (Jarir)",
            intro: "Physician providing patient evaluations and follow-ups. Expertise in managing chronic diseases and complex medical conditions.",
            rating: 4.7,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 10,
            patientsServed: 2150
        ),

        Doctor(
            name: "Dr. Sadaf Siddiqui",
            specialty: "Consultant Internal Medicine",
            hospital: "KIMSHEALTH Medical Center (Jarir)",
            intro: "Physician providing outpatient assessment and treatment. Expertise in managing chronic diseases and complex medical conditions.",
            rating: 3.5,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 10,
            patientsServed: 2350
        ),

        Doctor(
            name: "Dr. Sadia Ilyas",
            specialty: "General Practitioner",
            hospital: "KIMSHEALTH Medical Center (Jarir)",
            intro: "Clinician providing general consultations and follow-up care. Dedicated to primary care and patient wellness.",
            rating: 4.5,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 18,
            patientsServed: 5150
        ),

        Doctor(
            name: "Dr. Sanjeed Kabeer",
            specialty: "Consultant Internal Medicine",
            hospital: "KIMSHEALTH Medical Center (Jarir)",
            intro: "Physician providing diagnosis and ongoing care management. Expertise in managing chronic diseases and complex medical conditions.",
            rating: 3.9,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 20,
            patientsServed: 7500
        ),

        Doctor(
            name: "Dr. Seham Ameen Alasbahi",
            specialty: "Consultant Internal Medicine",
            hospital: "KIMSHEALTH Medical Center (Jarir)",
            intro: "Physician providing clinical consultations and treatment planning. Expertise in managing chronic diseases and complex medical conditions.",
            rating: 4.6,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 21,
            patientsServed: 6200
        ),

        Doctor(
            name: "Dr. Sumeira Rajput",
            specialty: "Consultant ENT",
            hospital: "KIMSHEALTH Medical Center (Jarir)",
            intro: "Clinician providing outpatient care and follow-up visits. Specializing in conditions affecting the ear, nose, and throat.",
            rating: 3.8,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 11,
            patientsServed: 2300
        ),

        Doctor(
            name: "Dr. Wael Nabil",
            specialty: "Consultant Internal Medicine",
            hospital: "KIMSHEALTH Medical Center (Jarir)",
            intro: "Physician providing diagnosis and medical management. Expertise in managing chronic diseases and complex medical conditions.",
            rating: 4.3,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 11,
            patientsServed: 2600
        ),

        Doctor(
            name: "Dr. Zaina Rahmath",
            specialty: "General Practitioner",
            hospital: "KIMSHEALTH Medical Center (Jarir)",
            intro: "Clinician providing consultations and continuity care. Dedicated to primary care and patient wellness.",
            rating: 3.6,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 12,
            patientsServed: 4250
        ),

        Doctor(
            name: "Dr. Zakia Mohammed Ibrahim",
            specialty: "Consultant Internal Medicine",
            hospital: "KIMSHEALTH Medical Center (Jarir)",
            intro: "Physician providing outpatient evaluation and treatment. Expertise in managing chronic diseases and complex medical conditions.",
            rating: 4.8,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 14,
            patientsServed: 4500
        ),

        Doctor(
            name: "Dr. Hiba Ibrahim Ebeidallah El-Hussien",
            specialty: "Consultant Internal Medicine",
            hospital: "Aster Sanad Hospital",
            intro: "Physician providing specialist consultations and patient management. Expertise in managing chronic diseases and complex medical conditions.",
            rating: 3.7,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 22,
            patientsServed: 8300
        ),

        Doctor(
            name: "Mr. Alfaisal Althaqib",
            specialty: "Senior Physiotherapist",
            hospital: "KIMSHEALTH Medical Center Jarir",
            intro: "Physiotherapy specialist. Focused on restoring mobility and physical function.",
            rating: 4.0,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 20,
            patientsServed: 5500
        ),

        Doctor(
            name: "Dr. Ameena Sheik",
            specialty: "Consultant Dermatology",
            hospital: "KIMSHEALTH Medical Center Jarir",
            intro: "Dermatology specialist (Dermatology & Cosmetology). Has helped hundreds of patients successfully manage acne, eczema, and chronic skin conditions.",
            rating: 4.4,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 10,
            patientsServed: 2300
        ),

        Doctor(
            name: "Dr. Amina Harmain",
            specialty: "Consultant Dentistry",
            hospital: "KIMSHEALTH Medical Center Jarir",
            intro: "Pedodontics (children’s dentistry). Dedicated to restoring smiles and maintaining oral health.",
            rating: 4.2,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 15,
            patientsServed: 3300
        ),

        Doctor(
            name: "Dr. Bushra Ansari",
            specialty: "Senior Physiotherapist",
            hospital: "KIMSHEALTH Medical Center Jarir",
            intro: "Physical Therapist (Physiotherapy). Focused on restoring mobility and physical function.",
            rating: 4.1,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 20,
            patientsServed: 7600
        ),

        Doctor(
            name: "Dr. Fadhel Mattar",
            specialty: "Consultant ENT",
            hospital: "KIMSHEALTH Medical Center Jarir",
            intro: "ENT (Ears, Nose & Throat) senior specialist. Specializing in conditions affecting the ear, nose, and throat.",
            rating: 3.6,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 18,
            patientsServed: 5200
        ),

        Doctor(
            name: "Dr. Fareeha Safdar",
            specialty: "Consultant OB-GYN",
            hospital: "KIMSHEALTH Medical Center Jarir",
            intro: "Senior gynecology specialist (Obstetrics & Gynecology). Providing comprehensive care for women's health and wellness.",
            rating: 4.6,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 20,
            patientsServed: 5850
        ),

        Doctor(
            name: "Dr. Fathallah Yousef",
            specialty: "Consultant Ophthalmology",
            hospital: "KIMSHEALTH Medical Center Jarir",
            intro: "Ophthalmology specialist. Extensive experience in cataract surgery and long-term vision care.",
            rating: 4.0,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 17,
            patientsServed: 6150
        ),

        Doctor(
            name: "Dr. Ishrat Hameed",
            specialty: "Consultant Internal Medicine",
            hospital: "KIMSHEALTH Medical Center Jarir",
            intro: "Internal Medicine. Expertise in managing chronic diseases and complex medical conditions.",
            rating: 3.8,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 11,
            patientsServed: 2350
        ),

        Doctor(
            name: "Dr. Hani Khalifa",
            specialty: "Consultant OB-GYN",
            hospital: "Kingdom Hospital & Consulting Clinics",
            intro: "Obstetrics & Gynecology (Women’s health). Providing comprehensive care for women's health and wellness.",
            rating: 4.5,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 22,
            patientsServed: 8100
        ),

        Doctor(
            name: "Dr. Nader Qalaji",
            specialty: "Consultant Urology",
            hospital: "Kingdom Hospital & Consulting Clinics",
            intro: "Urology (Urinary tract). Dedicated to providing comprehensive urological care.",
            rating: 3.5,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 15,
            patientsServed: 3450
        ),

        Doctor(
            name: "Dr. Khaled Aqeel",
            specialty: "Consultant Urology",
            hospital: "Kingdom Hospital & Consulting Clinics",
            intro: "Urology (Urinary tract). Dedicated to providing comprehensive urological care.",
            rating: 3.5,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 17,
            patientsServed: 4650
        ),

        Doctor(
            name: "Dr. Wael Salmon",
            specialty: "Consultant Urology",
            hospital: "Kingdom Hospital & Consulting Clinics",
            intro: "Urology (Urinary tract). Dedicated to providing comprehensive urological care.",
            rating: 4.8,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 20,
            patientsServed: 7650
        ),

        Doctor(
            name: "Dr. Fadi Al-Sous",
            specialty: "Consultant Cardiology",
            hospital: "Kingdom Hospital & Consulting Clinics",
            intro: "Cardiology (Kingdom Heart Center). Expert in cardiovascular health and preventive heart care.",
            rating: 4.1,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 17,
            patientsServed: 5950
        ),

        Doctor(
            name: "Dr. Samer Bazarbashi",
            specialty: "Consultant Cardiology",
            hospital: "Kingdom Hospital & Consulting Clinics",
            intro: "Cardiology (Kingdom Heart Center). Expert in cardiovascular health and preventive heart care.",
            rating: 4.7,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 19,
            patientsServed: 6000
        ),

        Doctor(
            name: "Dr. Mohammed Alghamdi",
            specialty: "Consultant Cardiology",
            hospital: "Kingdom Hospital & Consulting Clinics",
            intro: "Cardiology (Kingdom Heart Center). Expert in cardiovascular health and preventive heart care.",
            rating: 3.5,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 14,
            patientsServed: 3750
        ),

        Doctor(
            name: "Dr. Abdulmalik Kazbari",
            specialty: "Consultant Cardiology",
            hospital: "Kingdom Hospital & Consulting Clinics",
            intro: "Cardiology (Kingdom Heart Center). Expert in cardiovascular health and preventive heart care.",
            rating: 4.1,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 19,
            patientsServed: 7100
        ),

        Doctor(
            name: "Dr. Abdulrahman Nouri",
            specialty: "Consultant Cardiology",
            hospital: "Kingdom Hospital & Consulting Clinics",
            intro: "Cardiology (Kingdom Heart Center). Expert in cardiovascular health and preventive heart care.",
            rating: 3.9,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 16,
            patientsServed: 5050
        ),

        Doctor(
            name: "Dr. Khalid Alshammeri",
            specialty: "Consultant Internal Medicine",
            hospital: "Dallah Hospital",
            intro: "Consultant Internal Medicine with experience in chronic disease management. Expertise in managing chronic diseases and complex medical conditions.",
            rating: 3.8,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 19,
            patientsServed: 6150
        ),

        Doctor(
            name: "Dr. Ahmed Almutairi",
            specialty: "Consultant Orthopedics",
            hospital: "Dallah Hospital",
            intro: "Consultant Orthopedic Surgeon specializing in joint and sports injuries. Specializing in musculoskeletal health and recovery from sports injuries.",
            rating: 4.4,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 10,
            patientsServed: 3500
        ),

        Doctor(
            name: "Dr. Waleed Alharbi",
            specialty: "Consultant Cardiology",
            hospital: "Dallah Hospital",
            intro: "Consultant Cardiology focusing on interventional procedures. Expert in cardiovascular health and preventive heart care.",
            rating: 3.8,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 10,
            patientsServed: 3850
        ),

        Doctor(
            name: "Dr. Sara Alzahrani",
            specialty: "Consultant OB-GYN",
            hospital: "Dallah Hospital",
            intro: "Consultant Obstetrics & Gynecology with experience in high-risk pregnancies. Providing comprehensive care for women's health and wellness.",
            rating: 4.7,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 11,
            patientsServed: 4100
        ),

        Doctor(
            name: "Dr. Mohammed Alotaibi",
            specialty: "Consultant General Surgery",
            hospital: "Dallah Hospital",
            intro: "Consultant General Surgery specializing in laparoscopic procedures. Performed numerous successful procedures with a focus on patient safety and recovery.",
            rating: 4.5,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 12,
            patientsServed: 5150
        ),

        Doctor(
            name: "Dr. Faisal Alqahtani",
            specialty: "Consultant Urology",
            hospital: "Dallah Hospital",
            intro: "Consultant Neurology experienced in stroke and epilepsy care. Dedicated to providing comprehensive urological care.",
            rating: 4.0,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 11,
            patientsServed: 3850
        ),

        Doctor(
            name: "Dr. Huda Alenazi",
            specialty: "Consultant Dermatology",
            hospital: "Dallah Hospital",
            intro: "Consultant Dermatology providing medical and cosmetic skin treatments. Has helped hundreds of patients successfully manage acne, eczema, and chronic skin conditions.",
            rating: 3.6,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 21,
            patientsServed: 7350
        ),

        Doctor(
            name: "Dr. Bandar Alghamdi",
            specialty: "Consultant ENT",
            hospital: "Dallah Hospital",
            intro: "Consultant ENT specializing in sinus and hearing disorders. Specializing in conditions affecting the ear, nose, and throat.",
            rating: 4.4,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 15,
            patientsServed: 5150
        ),

        Doctor(
            name: "Dr. Reem Alshammari",
            specialty: "Consultant Pediatrics",
            hospital: "Dallah Hospital",
            intro: "Consultant Pediatrics experienced in neonatal and child health. Known for a compassionate approach to child healthcare and family guidance.",
            rating: 3.9,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 12,
            patientsServed: 3450
        ),

        Doctor(
            name: "Dr. Abdulrahman Alqahtani",
            specialty: "Consultant Urology",
            hospital: "Dallah Hospital",
            intro: "Consultant Urology treating kidney stones and prostate conditions. Dedicated to providing comprehensive urological care.",
            rating: 4.5,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 12,
            patientsServed: 4350
        ),

        Doctor(
            name: "Dr. Nasser Almutlaq",
            specialty: "Consultant ENT",
            hospital: "Dallah Hospital",
            intro: "Consultant Anesthesiology with experience in surgical pain management. Specializing in conditions affecting the ear, nose, and throat.",
            rating: 4.5,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 16,
            patientsServed: 5250
        ),

        Doctor(
            name: "Dr. Laila Alharbi",
            specialty: "Consultant Family Medicine",
            hospital: "Dallah Hospital",
            intro: "Consultant Family Medicine providing comprehensive primary care. Focused on comprehensive health management for the whole family.",
            rating: 3.7,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 19,
            patientsServed: 6400
        ),

        Doctor(
            name: "Dr. Yasser Alotaibi",
            specialty: "Consultant ENT",
            hospital: "Dallah Hospital",
            intro: "Consultant Gastroenterology specializing in endoscopy procedures. Specializing in conditions affecting the ear, nose, and throat.",
            rating: 3.7,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 13,
            patientsServed: 3900
        ),

        Doctor(
            name: "Dr. Mona Alghamdi",
            specialty: "Consultant Endocrinology",
            hospital: "Dallah Hospital",
            intro: "Consultant Endocrinology treating diabetes and thyroid disorders. Expert in hormonal balance and diabetes management.",
            rating: 3.6,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 12,
            patientsServed: 3450
        ),

        Doctor(
            name: "Dr. Saleh Alharbi",
            specialty: "Consultant Pulmonology",
            hospital: "Dallah Hospital",
            intro: "Consultant Pulmonology managing asthma and respiratory diseases. Expert in respiratory health and lung conditions.",
            rating: 4.1,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 12,
            patientsServed: 4300
        ),

        Doctor(
            name: "Dr. Abdullah Almutairi",
            specialty: "Consultant ENT",
            hospital: "Dallah Hospital",
            intro: "Consultant Nephrology managing kidney and dialysis patients. Specializing in conditions affecting the ear, nose, and throat.",
            rating: 3.7,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 19,
            patientsServed: 5600
        ),

        Doctor(
            name: "Dr. Rania Alzahrani",
            specialty: "Consultant Radiology",
            hospital: "Dallah Hospital",
            intro: "Consultant Radiology specializing in diagnostic imaging.",
            rating: 4.5,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 21,
            patientsServed: 7800
        ),

        Doctor(
            name: "Dr. Hassan Alqahtani",
            specialty: "Consultant Emergency Medicine",
            hospital: "Dallah Hospital",
            intro: "Consultant Emergency Medicine with trauma care experience.",
            rating: 4.8,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 17,
            patientsServed: 5700
        ),

        Doctor(
            name: "Dr. Amal Alenazi",
            specialty: "Consultant Rheumatology",
            hospital: "Dallah Hospital",
            intro: "Consultant Rheumatology managing autoimmune and joint disorders. Expert in managing autoimmune diseases and joint conditions.",
            rating: 4.5,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 13,
            patientsServed: 4300
        ),

        Doctor(
            name: "Dr. Majed Alotaibi",
            specialty: "Consultant General Surgery",
            hospital: "Dallah Hospital",
            intro: "Consultant Plastic Surgery focusing on reconstructive procedures. Performed numerous successful procedures with a focus on patient safety and recovery.",
            rating: 4.4,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 18,
            patientsServed: 4500
        ),

        Doctor(
            name: "Dr. Abdullah Alzahrani",
            specialty: "Consultant Internal Medicine",
            hospital: "King Faisal Specialist Hospital & Research Centre",
            intro: "Consultant Internal Medicine with experience in managing chronic medical conditions. Expertise in managing chronic diseases and complex medical conditions.",
            rating: 4.3,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 22,
            patientsServed: 5800
        ),

        Doctor(
            name: "Dr. Khalid Alsubaie",
            specialty: "Consultant Cardiology",
            hospital: "King Faisal Specialist Hospital & Research Centre",
            intro: "Consultant Cardiology specializing in heart failure and ischemic heart disease. Expert in cardiovascular health and preventive heart care.",
            rating: 3.6,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 15,
            patientsServed: 4050
        ),

        Doctor(
            name: "Dr. Fahad Almutairi",
            specialty: "Consultant Urology",
            hospital: "King Faisal Specialist Hospital & Research Centre",
            intro: "Consultant Neurology focusing on stroke and neurological disorders. Dedicated to providing comprehensive urological care.",
            rating: 4.6,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 21,
            patientsServed: 4700
        ),

        Doctor(
            name: "Dr. Reem Alharbi",
            specialty: "Consultant Endocrinology",
            hospital: "King Faisal Specialist Hospital & Research Centre",
            intro: "Consultant Endocrinology treating diabetes and hormonal disorders. Expert in hormonal balance and diabetes management.",
            rating: 3.9,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 17,
            patientsServed: 4400
        ),

        Doctor(
            name: "Dr. Mohammed Alqahtani",
            specialty: "Consultant ENT",
            hospital: "King Faisal Specialist Hospital & Research Centre",
            intro: "Consultant Oncology with experience in solid tumor management. Specializing in conditions affecting the ear, nose, and throat.",
            rating: 3.5,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 16,
            patientsServed: 5750
        ),

        Doctor(
            name: "Dr. Sara Alotaibi",
            specialty: "Consultant Hematology",
            hospital: "King Faisal Specialist Hospital & Research Centre",
            intro: "Consultant Hematology specializing in blood disorders and anemia.",
            rating: 4.5,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 11,
            patientsServed: 3900
        ),

        Doctor(
            name: "Dr. Nasser Alghamdi",
            specialty: "Consultant Nephrology",
            hospital: "King Faisal Specialist Hospital & Research Centre",
            intro: "Consultant Nephrology managing kidney disease and transplant follow-up. Specializing in kidney health and dialysis care.",
            rating: 3.6,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 18,
            patientsServed: 6450
        ),

        Doctor(
            name: "Dr. Huda Alshammari",
            specialty: "Consultant Rheumatology",
            hospital: "King Faisal Specialist Hospital & Research Centre",
            intro: "Consultant Rheumatology treating autoimmune and joint diseases. Expert in managing autoimmune diseases and joint conditions.",
            rating: 4.5,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 12,
            patientsServed: 2650
        ),

        Doctor(
            name: "Dr. Yasser Alharbi",
            specialty: "Consultant Pulmonology",
            hospital: "King Faisal Specialist Hospital & Research Centre",
            intro: "Consultant Pulmonology managing asthma and chronic lung disease. Expert in respiratory health and lung conditions.",
            rating: 4.6,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 19,
            patientsServed: 5400
        ),

        Doctor(
            name: "Dr. Laila Alzahrani",
            specialty: "Consultant Family Medicine",
            hospital: "King Faisal Specialist Hospital & Research Centre",
            intro: "Consultant Family Medicine providing comprehensive primary care. Focused on comprehensive health management for the whole family.",
            rating: 4.1,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 10,
            patientsServed: 2450
        ),

        Doctor(
            name: "Dr. Ahmed Alenezi",
            specialty: "Consultant General Surgery",
            hospital: "Dr. Sulaiman Al Habib Medical Group",
            intro: "Consultant General Surgery specializing in laparoscopic procedures. Performed numerous successful procedures with a focus on patient safety and recovery.",
            rating: 3.9,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 11,
            patientsServed: 2850
        ),

        Doctor(
            name: "Dr. Faisal Alharbi",
            specialty: "Consultant Orthopedics",
            hospital: "Dr. Sulaiman Al Habib Medical Group",
            intro: "Consultant Orthopedic Surgery focusing on joint replacement. Specializing in musculoskeletal health and recovery from sports injuries.",
            rating: 4.9,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 18,
            patientsServed: 6450
        ),

        Doctor(
            name: "Dr. Rawan Almutairi",
            specialty: "Consultant OB-GYN",
            hospital: "Dr. Sulaiman Al Habib Medical Group",
            intro: "Consultant Obstetrics & Gynecology with experience in high-risk pregnancy. Providing comprehensive care for women's health and wellness.",
            rating: 3.9,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 11,
            patientsServed: 4100
        ),

        Doctor(
            name: "Dr. Bandar Alqahtani",
            specialty: "Consultant ENT",
            hospital: "Dr. Sulaiman Al Habib Medical Group",
            intro: "Consultant ENT specializing in sinus and nasal disorders. Specializing in conditions affecting the ear, nose, and throat.",
            rating: 4.2,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 16,
            patientsServed: 3750
        ),

        Doctor(
            name: "Dr. Mona Alsubaie",
            specialty: "Consultant Dermatology",
            hospital: "Dr. Sulaiman Al Habib Medical Group",
            intro: "Consultant Dermatology providing medical and cosmetic skin treatments. Has helped hundreds of patients successfully manage acne, eczema, and chronic skin conditions.",
            rating: 3.9,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 18,
            patientsServed: 7000
        ),

        Doctor(
            name: "Dr. Abdulrahman Alotaibi",
            specialty: "Consultant Urology",
            hospital: "Dr. Sulaiman Al Habib Medical Group",
            intro: "Consultant Urology treating prostate and urinary tract conditions. Dedicated to providing comprehensive urological care.",
            rating: 4.1,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 11,
            patientsServed: 4300
        ),

        Doctor(
            name: "Dr. Nada Alharbi",
            specialty: "Consultant Pediatrics",
            hospital: "Dr. Sulaiman Al Habib Medical Group",
            intro: "Consultant Pediatrics experienced in newborn and child healthcare. Known for a compassionate approach to child healthcare and family guidance.",
            rating: 3.8,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 12,
            patientsServed: 3150
        ),

        Doctor(
            name: "Dr. Saeed Alghamdi",
            specialty: "Consultant ENT",
            hospital: "Dr. Sulaiman Al Habib Medical Group",
            intro: "Consultant Gastroenterology specializing in endoscopy and liver disease. Specializing in conditions affecting the ear, nose, and throat.",
            rating: 4.1,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 20,
            patientsServed: 5000
        ),

        Doctor(
            name: "Dr. Amal Alzahrani",
            specialty: "Consultant Radiology",
            hospital: "Dr. Sulaiman Al Habib Medical Group",
            intro: "Consultant Radiology specializing in diagnostic imaging.",
            rating: 4.3,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 21,
            patientsServed: 7850
        ),

        Doctor(
            name: "Dr. Majed Almutairi",
            specialty: "Consultant ENT",
            hospital: "Dr. Sulaiman Al Habib Medical Group",
            intro: "Consultant Anesthesiology with experience in surgical pain management. Specializing in conditions affecting the ear, nose, and throat.",
            rating: 4.3,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 17,
            patientsServed: 5650
        ),

        Doctor(
            name: "Dr. Ahmed Alharbi",
            specialty: "Consultant Emergency Medicine",
            hospital: "Kingdom Hospital & Consulting Clinics",
            intro: "Consultant Emergency Medicine with experience in trauma and acute care.",
            rating: 4.6,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 16,
            patientsServed: 4650
        ),

        Doctor(
            name: "Dr. Khaled Alotaibi",
            specialty: "Consultant General Surgery",
            hospital: "Kingdom Hospital & Consulting Clinics",
            intro: "Consultant General Surgery specializing in minimally invasive procedures. Performed numerous successful procedures with a focus on patient safety and recovery.",
            rating: 3.8,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 21,
            patientsServed: 5550
        ),

        Doctor(
            name: "Dr. Reem Alqahtani",
            specialty: "Consultant OB-GYN",
            hospital: "Kingdom Hospital & Consulting Clinics",
            intro: "Consultant Obstetrics & Gynecology focusing on women’s health. Providing comprehensive care for women's health and wellness.",
            rating: 3.8,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 10,
            patientsServed: 2450
        ),

        Doctor(
            name: "Dr. Nasser Almutairi",
            specialty: "Consultant Cardiology",
            hospital: "Kingdom Hospital & Consulting Clinics",
            intro: "Consultant Cardiology experienced in cardiac diagnostics and management. Expert in cardiovascular health and preventive heart care.",
            rating: 3.9,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 10,
            patientsServed: 3850
        ),

        Doctor(
            name: "Dr. Hala Alzahrani",
            specialty: "Consultant Dermatology",
            hospital: "Kingdom Hospital & Consulting Clinics",
            intro: "Consultant Dermatology providing medical and cosmetic treatments. Has helped hundreds of patients successfully manage acne, eczema, and chronic skin conditions.",
            rating: 3.8,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 15,
            patientsServed: 5800
        ),

        Doctor(
            name: "Dr. Abdullah Alsubaie",
            specialty: "Consultant Orthopedics",
            hospital: "Kingdom Hospital & Consulting Clinics",
            intro: "Consultant Orthopedic Surgery specializing in joint and spine conditions. Specializing in musculoskeletal health and recovery from sports injuries.",
            rating: 4.8,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 19,
            patientsServed: 6300
        ),

        Doctor(
            name: "Dr. Yasser Alghamdi",
            specialty: "Consultant ENT",
            hospital: "Kingdom Hospital & Consulting Clinics",
            intro: "Consultant Gastroenterology with experience in liver and digestive diseases. Specializing in conditions affecting the ear, nose, and throat.",
            rating: 3.5,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 19,
            patientsServed: 6500
        ),

        Doctor(
            name: "Dr. Mona Alenazi",
            specialty: "Consultant Endocrinology",
            hospital: "Kingdom Hospital & Consulting Clinics",
            intro: "Consultant Endocrinology managing diabetes and hormonal disorders. Expert in hormonal balance and diabetes management.",
            rating: 4.4,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 12,
            patientsServed: 3450
        ),

        Doctor(
            name: "Dr. Saeed Alqahtani",
            specialty: "Consultant Pulmonology",
            hospital: "Kingdom Hospital & Consulting Clinics",
            intro: "Consultant Pulmonology treating asthma and chronic lung diseases. Expert in respiratory health and lung conditions.",
            rating: 4.1,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 18,
            patientsServed: 5750
        ),

        Doctor(
            name: "Dr. Faisal Alzahrani",
            specialty: "Consultant Urology",
            hospital: "National Guard Health Affairs",
            intro: "Consultant Neurology focusing on stroke and neurological disorders. Dedicated to providing comprehensive urological care.",
            rating: 4.8,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 13,
            patientsServed: 3300
        ),

        Doctor(
            name: "Dr. Sara Alharbi",
            specialty: "Consultant Pediatrics",
            hospital: "National Guard Health Affairs",
            intro: "Consultant Pediatrics with experience in neonatal and child care. Known for a compassionate approach to child healthcare and family guidance.",
            rating: 4.9,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 17,
            patientsServed: 5900
        ),

        Doctor(
            name: "Dr. Mohammed Almutairi",
            specialty: "Consultant Internal Medicine",
            hospital: "National Guard Health Affairs",
            intro: "Consultant Internal Medicine managing complex medical cases. Expertise in managing chronic diseases and complex medical conditions.",
            rating: 4.1,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 21,
            patientsServed: 6350
        ),

        Doctor(
            name: "Dr. Rania Alqahtani",
            specialty: "Consultant Radiology",
            hospital: "National Guard Health Affairs",
            intro: "Consultant Radiology specializing in advanced diagnostic imaging.",
            rating: 4.0,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 10,
            patientsServed: 2150
        ),

        Doctor(
            name: "Dr. Abdulaziz Alotaibi",
            specialty: "Consultant Urology",
            hospital: "National Guard Health Affairs",
            intro: "Consultant Urology treating kidney and prostate conditions. Dedicated to providing comprehensive urological care.",
            rating: 3.6,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 11,
            patientsServed: 3450
        ),

        Doctor(
            name: "Dr. Huda Alghamdi",
            specialty: "Consultant Rheumatology",
            hospital: "National Guard Health Affairs",
            intro: "Consultant Rheumatology managing autoimmune and joint diseases. Expert in managing autoimmune diseases and joint conditions.",
            rating: 3.5,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 17,
            patientsServed: 5600
        ),

        Doctor(
            name: "Dr. Bandar Alsubaie",
            specialty: "Consultant ENT",
            hospital: "National Guard Health Affairs",
            intro: "Consultant ENT specializing in sinus and hearing disorders. Specializing in conditions affecting the ear, nose, and throat.",
            rating: 4.6,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 13,
            patientsServed: 3600
        ),

        Doctor(
            name: "Dr. Amal Alharbi",
            specialty: "Consultant Psychiatry",
            hospital: "National Guard Health Affairs",
            intro: "Consultant Psychiatry providing mental health assessment and care. Committed to mental wellness and personalized therapeutic plans.",
            rating: 3.6,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 19,
            patientsServed: 6450
        ),

        Doctor(
            name: "Dr. Majed Alqahtani",
            specialty: "Consultant Anesthesiology",
            hospital: "National Guard Health Affairs",
            intro: "Consultant Anesthesiology with experience in perioperative care.",
            rating: 4.0,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 14,
            patientsServed: 3300
        ),

        Doctor(
            name: "Dr. Noor Alzahrani",
            specialty: "Consultant Ophthalmology",
            hospital: "National Guard Health Affairs",
            intro: "Consultant Ophthalmology specializing in medical and surgical eye care. Extensive experience in cataract surgery and long-term vision care.",
            rating: 4.8,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 19,
            patientsServed: 7400
        ),

        Doctor(
            name: "Dr. Abdulrahman Alharbi",
            specialty: "Consultant Internal Medicine",
            hospital: "Al Hammadi Hospital – Olaya",
            intro: "Consultant Internal Medicine with experience in managing complex adult cases. Expertise in managing chronic diseases and complex medical conditions.",
            rating: 3.5,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 12,
            patientsServed: 2850
        ),

        Doctor(
            name: "Dr. Khaled Alqahtani",
            specialty: "Consultant Cardiology",
            hospital: "Al Hammadi Hospital – Olaya",
            intro: "Consultant Cardiology focusing on diagnostic cardiology and heart disease management. Expert in cardiovascular health and preventive heart care.",
            rating: 4.4,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 20,
            patientsServed: 5600
        ),

        Doctor(
            name: "Dr. Rawan Alzahrani",
            specialty: "Consultant OB-GYN",
            hospital: "Al Hammadi Hospital – Olaya",
            intro: "Consultant Obstetrics & Gynecology with experience in prenatal and delivery care. Providing comprehensive care for women's health and wellness.",
            rating: 3.5,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 18,
            patientsServed: 6300
        ),

        Doctor(
            name: "Dr. Nasser Alotaibi",
            specialty: "Consultant Orthopedics",
            hospital: "Al Hammadi Hospital – Olaya",
            intro: "Consultant Orthopedic Surgery specializing in trauma and fracture management. Specializing in musculoskeletal health and recovery from sports injuries.",
            rating: 4.9,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 16,
            patientsServed: 4350
        ),

        Doctor(
            name: "Dr. Huda Alsubaie",
            specialty: "Consultant Dermatology",
            hospital: "Al Hammadi Hospital – Olaya",
            intro: "Consultant Dermatology providing medical and cosmetic skin treatments. Has helped hundreds of patients successfully manage acne, eczema, and chronic skin conditions.",
            rating: 4.5,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 19,
            patientsServed: 7250
        ),

        Doctor(
            name: "Dr. Yasser Almutairi",
            specialty: "Consultant ENT",
            hospital: "Al Hammadi Hospital – Olaya",
            intro: "Consultant Gastroenterology with experience in endoscopy procedures. Specializing in conditions affecting the ear, nose, and throat.",
            rating: 4.1,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 19,
            patientsServed: 4550
        ),

        Doctor(
            name: "Dr. Saeed Alharbi",
            specialty: "Consultant Pulmonology",
            hospital: "Al Hammadi Hospital – Olaya",
            intro: "Consultant Pulmonology managing asthma and chronic lung disease. Expert in respiratory health and lung conditions.",
            rating: 3.7,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 15,
            patientsServed: 5400
        ),

        Doctor(
            name: "Dr. Laila Alotaibi",
            specialty: "Consultant Family Medicine",
            hospital: "Al Hammadi Hospital – Olaya",
            intro: "Consultant Family Medicine providing comprehensive primary care. Focused on comprehensive health management for the whole family.",
            rating: 4.4,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 11,
            patientsServed: 4000
        ),

        Doctor(
            name: "Dr. Ahmed Alsubaie",
            specialty: "Consultant General Surgery",
            hospital: "Riyadh Care Hospital",
            intro: "Consultant General Surgery specializing in laparoscopic procedures. Performed numerous successful procedures with a focus on patient safety and recovery.",
            rating: 3.6,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 11,
            patientsServed: 3350
        ),

        Doctor(
            name: "Dr. Reem Almutairi",
            specialty: "Consultant Radiology",
            hospital: "Riyadh Care Hospital",
            intro: "Consultant Radiology specializing in diagnostic imaging.",
            rating: 4.5,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 17,
            patientsServed: 5550
        ),

        Doctor(
            name: "Dr. Bandar Alzahrani",
            specialty: "Consultant ENT",
            hospital: "Riyadh Care Hospital",
            intro: "Consultant ENT focusing on sinus and hearing disorders. Specializing in conditions affecting the ear, nose, and throat.",
            rating: 4.8,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 20,
            patientsServed: 5200
        ),

        Doctor(
            name: "Dr. Amal Alqahtani",
            specialty: "Consultant Rheumatology",
            hospital: "Riyadh Care Hospital",
            intro: "Consultant Rheumatology managing autoimmune and joint diseases. Expert in managing autoimmune diseases and joint conditions.",
            rating: 3.9,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 14,
            patientsServed: 3200
        ),

        Doctor(
            name: "Dr. Majed Alharbi",
            specialty: "Consultant Anesthesiology",
            hospital: "Riyadh Care Hospital",
            intro: "Consultant Anesthesiology with experience in perioperative care.",
            rating: 4.4,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 13,
            patientsServed: 2800
        ),

        Doctor(
            name: "Dr. Noor Alotaibi",
            specialty: "Consultant Ophthalmology",
            hospital: "Riyadh Care Hospital",
            intro: "Consultant Ophthalmology providing medical and surgical eye care. Extensive experience in cataract surgery and long-term vision care.",
            rating: 4.3,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 21,
            patientsServed: 7500
        ),

        Doctor(
            name: "Dr. Hassan Alghamdi",
            specialty: "Consultant Emergency Medicine",
            hospital: "Riyadh Care Hospital",
            intro: "Consultant Emergency Medicine with experience in acute and trauma care.",
            rating: 4.2,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 18,
            patientsServed: 4600
        ),

        Doctor(
            name: "Dr. Rania Alsubaie",
            specialty: "Consultant Psychiatry",
            hospital: "Riyadh Care Hospital",
            intro: "Consultant Psychiatry providing mental health assessment and treatment. Committed to mental wellness and personalized therapeutic plans.",
            rating: 4.2,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 20,
            patientsServed: 5650
        ),

        Doctor(
            name: "Dr. Abdulaziz Almutairi",
            specialty: "Consultant Internal Medicine",
            hospital: "King Saud Medical City",
            intro: "Consultant Internal Medicine with experience in managing chronic and acute conditions. Expertise in managing chronic diseases and complex medical conditions.",
            rating: 4.5,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 21,
            patientsServed: 5100
        ),

        Doctor(
            name: "Dr. Khaled Alharbi",
            specialty: "Consultant Cardiology",
            hospital: "King Saud Medical City",
            intro: "Consultant Cardiology specializing in coronary artery disease management. Expert in cardiovascular health and preventive heart care.",
            rating: 4.5,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 20,
            patientsServed: 4700
        ),

        Doctor(
            name: "Dr. Reem Alzahrani",
            specialty: "Consultant OB-GYN",
            hospital: "King Saud Medical City",
            intro: "Consultant Obstetrics & Gynecology with experience in prenatal and delivery care. Providing comprehensive care for women's health and wellness.",
            rating: 4.2,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 16,
            patientsServed: 6250
        ),

        Doctor(
            name: "Dr. Nasser Alsubaie",
            specialty: "Consultant Orthopedics",
            hospital: "King Saud Medical City",
            intro: "Consultant Orthopedic Surgery specializing in trauma and fracture care. Specializing in musculoskeletal health and recovery from sports injuries.",
            rating: 4.3,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 22,
            patientsServed: 6550
        ),

        Doctor(
            name: "Dr. Huda Alotaibi",
            specialty: "Consultant Dermatology",
            hospital: "King Saud Medical City",
            intro: "Consultant Dermatology providing medical skin treatments. Has helped hundreds of patients successfully manage acne, eczema, and chronic skin conditions.",
            rating: 3.5,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 16,
            patientsServed: 3750
        ),

        Doctor(
            name: "Dr. Mona Alharbi",
            specialty: "Consultant Endocrinology",
            hospital: "King Saud Medical City",
            intro: "Consultant Endocrinology treating diabetes and hormonal disorders. Expert in hormonal balance and diabetes management.",
            rating: 4.8,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 10,
            patientsServed: 3550
        ),

        Doctor(
            name: "Dr. Saeed Almutairi",
            specialty: "Consultant Pulmonology",
            hospital: "King Saud Medical City",
            intro: "Consultant Pulmonology managing asthma and chronic lung disease. Expert in respiratory health and lung conditions.",
            rating: 4.3,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 21,
            patientsServed: 8600
        ),

        Doctor(
            name: "Dr. Laila Alqahtani",
            specialty: "Consultant Family Medicine",
            hospital: "King Saud Medical City",
            intro: "Consultant Family Medicine providing comprehensive primary care. Focused on comprehensive health management for the whole family.",
            rating: 3.8,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 15,
            patientsServed: 3800
        ),

        Doctor(
            name: "Dr. Ahmed Alzahrani",
            specialty: "Consultant General Surgery",
            hospital: "Al Mouwasat Hospital",
            intro: "Consultant General Surgery specializing in laparoscopic procedures. Performed numerous successful procedures with a focus on patient safety and recovery.",
            rating: 3.8,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 21,
            patientsServed: 5750
        ),

        Doctor(
            name: "Dr. Noor Almutairi",
            specialty: "Consultant Ophthalmology",
            hospital: "Al Mouwasat Hospital",
            intro: "Consultant Ophthalmology providing medical and surgical eye care. Extensive experience in cataract surgery and long-term vision care.",
            rating: 3.9,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 18,
            patientsServed: 4850
        ),

        Doctor(
            name: "Dr. Hassan Alzahrani",
            specialty: "Consultant Emergency Medicine",
            hospital: "Al Mouwasat Hospital",
            intro: "Consultant Emergency Medicine with experience in acute and trauma care.",
            rating: 3.9,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 18,
            patientsServed: 5400
        ),

        Doctor(
            name: "Dr. Raghad Alharbi",
            specialty: "Consultant Psychiatry",
            hospital: "Al Mouwasat Hospital",
            intro: "Consultant Psychiatry providing mental health assessment and treatment. Committed to mental wellness and personalized therapeutic plans.",
            rating: 4.0,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 21,
            patientsServed: 7550
        ),

        Doctor(
            name: "Dr. Abdulrahman Alenezi",
            specialty: "Consultant Internal Medicine",
            hospital: "Dr. Sulaiman Al Habib Hospital – Olaya",
            intro: "Consultant Internal Medicine with experience in managing complex adult cases. Expertise in managing chronic diseases and complex medical conditions.",
            rating: 3.6,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 16,
            patientsServed: 4350
        ),

        Doctor(
            name: "Dr. Khalid Alharbi",
            specialty: "Consultant Cardiology",
            hospital: "Dr. Sulaiman Al Habib Hospital – Olaya",
            intro: "Consultant Cardiology specializing in coronary artery disease. Expert in cardiovascular health and preventive heart care.",
            rating: 3.9,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 17,
            patientsServed: 4000
        ),

        Doctor(
            name: "Dr. Sara Alenezi",
            specialty: "Consultant Pediatrics",
            hospital: "Al Hammadi Hospital – Nuzha",
            intro: "Consultant Pediatrics with experience in child development. Known for a compassionate approach to child healthcare and family guidance.",
            rating: 3.9,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 13,
            patientsServed: 3900
        ),

        Doctor(
            name: "Dr. Rania Alharbi",
            specialty: "Consultant Radiology",
            hospital: "Al Hammadi Hospital – Nuzha",
            intro: "Consultant Radiology specializing in diagnostic imaging.",
            rating: 3.9,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 20,
            patientsServed: 7100
        ),

        Doctor(
            name: "Dr. Amal Alsubaie",
            specialty: "Consultant Rheumatology",
            hospital: "Al Hammadi Hospital – Nuzha",
            intro: "Consultant Rheumatology managing autoimmune diseases. Expert in managing autoimmune diseases and joint conditions.",
            rating: 3.9,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 11,
            patientsServed: 3650
        ),

        Doctor(
            name: "Dr. Noor Alghamdi",
            specialty: "Consultant Ophthalmology",
            hospital: "Al Hammadi Hospital – Nuzha",
            intro: "Consultant Ophthalmology providing medical and surgical eye care. Extensive experience in cataract surgery and long-term vision care.",
            rating: 4.7,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 21,
            patientsServed: 4100
        ),

        Doctor(
            name: "Dr. Abdulaziz Alqahtani",
            specialty: "Consultant Internal Medicine",
            hospital: "King Abdulaziz Medical City (National Guard)",
            intro: "Consultant Internal Medicine with experience in complex adult care. Expertise in managing chronic diseases and complex medical conditions.",
            rating: 4.4,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 20,
            patientsServed: 4700
        ),

        Doctor(
            name: "Dr. Khaled Almutairi",
            specialty: "Consultant Cardiology",
            hospital: "King Abdulaziz Medical City (National Guard)",
            intro: "Consultant Cardiology specializing in non-invasive cardiac diagnostics. Expert in cardiovascular health and preventive heart care.",
            rating: 4.3,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 13,
            patientsServed: 3450
        ),

        Doctor(
            name: "Dr. Reem Alenezi",
            specialty: "Consultant OB-GYN",
            hospital: "King Abdulaziz Medical City (National Guard)",
            intro: "Consultant Obstetrics & Gynecology with experience in antenatal care. Providing comprehensive care for women's health and wellness.",
            rating: 4.1,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 14,
            patientsServed: 5750
        ),

        Doctor(
            name: "Dr. Huda Alzahrani",
            specialty: "Consultant Dermatology",
            hospital: "King Abdulaziz Medical City (National Guard)",
            intro: "Consultant Dermatology providing medical dermatology services. Has helped hundreds of patients successfully manage acne, eczema, and chronic skin conditions.",
            rating: 3.7,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 10,
            patientsServed: 2500
        ),

        Doctor(
            name: "Dr. Yasser Alqahtani",
            specialty: "Consultant ENT",
            hospital: "King Abdulaziz Medical City (National Guard)",
            intro: "Consultant Gastroenterology with experience in diagnostic endoscopy. Specializing in conditions affecting the ear, nose, and throat.",
            rating: 4.7,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 17,
            patientsServed: 5300
        ),

        Doctor(
            name: "Dr. Mona Alotaibi",
            specialty: "Consultant Endocrinology",
            hospital: "King Abdulaziz Medical City (National Guard)",
            intro: "Consultant Endocrinology managing diabetes and hormonal disorders. Expert in hormonal balance and diabetes management.",
            rating: 3.9,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 11,
            patientsServed: 2650
        ),

        Doctor(
            name: "Dr. Sara Almutairi",
            specialty: "Consultant Pediatrics",
            hospital: "Prince Sultan Military Medical City",
            intro: "Consultant Pediatrics with experience in general child health. Known for a compassionate approach to child healthcare and family guidance.",
            rating: 4.6,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 20,
            patientsServed: 7300
        ),

        Doctor(
            name: "Dr. Mohammed Alharbi",
            specialty: "Consultant Urology",
            hospital: "Prince Sultan Military Medical City",
            intro: "Consultant Urology treating urinary tract and prostate conditions. Dedicated to providing comprehensive urological care.",
            rating: 4.8,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 22,
            patientsServed: 5100
        ),

        Doctor(
            name: "Dr. Amal Alghamdi",
            specialty: "Consultant Rheumatology",
            hospital: "Prince Sultan Military Medical City",
            intro: "Consultant Rheumatology managing autoimmune joint diseases. Expert in managing autoimmune diseases and joint conditions.",
            rating: 4.8,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 13,
            patientsServed: 4850
        ),

        Doctor(
            name: "Dr. Majed Alzahrani",
            specialty: "Consultant Anesthesiology",
            hospital: "Prince Sultan Military Medical City",
            intro: "Consultant Anesthesiology with perioperative care experience.",
            rating: 4.2,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 20,
            patientsServed: 6100
        ),

        Doctor(
            name: "Dr. Hassan Almutairi",
            specialty: "Consultant Emergency Medicine",
            hospital: "Prince Sultan Military Medical City",
            intro: "Consultant Emergency Medicine with trauma care experience.",
            rating: 3.7,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 19,
            patientsServed: 4100
        ),

        Doctor(
            name: "Dr. Raghad Alqahtani",
            specialty: "Consultant Psychiatry",
            hospital: "Prince Sultan Military Medical City",
            intro: "Consultant Psychiatry providing mental health assessment and treatment. Committed to mental wellness and personalized therapeutic plans.",
            rating: 4.1,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 15,
            patientsServed: 4150
        ),

        Doctor(
            name: "Dr. Abdulrahman Almutairi",
            specialty: "Consultant Internal Medicine",
            hospital: "King Fahad Medical City",
            intro: "Consultant Internal Medicine managing chronic adult conditions. Expertise in managing chronic diseases and complex medical conditions.",
            rating: 4.9,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 19,
            patientsServed: 6000
        ),

        Doctor(
            name: "Dr. Bandar Alharbi",
            specialty: "Consultant ENT",
            hospital: "Riyadh Military Hospital",
            intro: "Consultant ENT managing sinus and hearing disorders. Specializing in conditions affecting the ear, nose, and throat.",
            rating: 4.3,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 18,
            patientsServed: 4650
        ),

        Doctor(
            name: "Dr. Abdulrahman Alzahrani",
            specialty: "Consultant Internal Medicine",
            hospital: "Prince Mohammed Bin Abdulaziz Hospital (NGHA)",
            intro: "Consultant Internal Medicine managing hypertension and chronic diseases. Expertise in managing chronic diseases and complex medical conditions.",
            rating: 4.8,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 11,
            patientsServed: 4750
        ),

        Doctor(
            name: "Dr. Faisal Alotaibi",
            specialty: "Consultant Urology",
            hospital: "Prince Mohammed Bin Abdulaziz Hospital (NGHA)",
            intro: "Consultant Neurology treating epilepsy and neurological disorders. Dedicated to providing comprehensive urological care.",
            rating: 3.9,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 19,
            patientsServed: 5450
        ),

        Doctor(
            name: "Dr. Reem Alsubaie",
            specialty: "Consultant OB-GYN",
            hospital: "Prince Mohammed Bin Abdulaziz Hospital (NGHA)",
            intro: "Consultant Obstetrics & Gynecology with experience in antenatal care. Providing comprehensive care for women's health and wellness.",
            rating: 4.7,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 10,
            patientsServed: 3750
        ),

        Doctor(
            name: "Dr. Nasser Alqahtani",
            specialty: "Consultant Orthopedics",
            hospital: "Prince Mohammed Bin Abdulaziz Hospital (NGHA)",
            intro: "Consultant Orthopedic Surgery specializing in sports injuries. Specializing in musculoskeletal health and recovery from sports injuries.",
            rating: 4.1,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 13,
            patientsServed: 3450
        ),

        Doctor(
            name: "Dr. Huda Alharbi",
            specialty: "Consultant Dermatology",
            hospital: "Prince Mohammed Bin Abdulaziz Hospital (NGHA)",
            intro: "Consultant Dermatology providing medical dermatology services. Has helped hundreds of patients successfully manage acne, eczema, and chronic skin conditions.",
            rating: 4.7,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 15,
            patientsServed: 4100
        ),

        Doctor(
            name: "Dr. Yasser Alzahrani",
            specialty: "Consultant ENT",
            hospital: "Prince Mohammed Bin Abdulaziz Hospital (NGHA)",
            intro: "Consultant Gastroenterology experienced in endoscopy procedures. Specializing in conditions affecting the ear, nose, and throat.",
            rating: 4.3,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 11,
            patientsServed: 4750
        ),

        Doctor(
            name: "Dr. Mona Almutairi",
            specialty: "Consultant Endocrinology",
            hospital: "Prince Mohammed Bin Abdulaziz Hospital (NGHA)",
            intro: "Consultant Endocrinology managing diabetes and hormonal disorders. Expert in hormonal balance and diabetes management.",
            rating: 4.3,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 11,
            patientsServed: 2600
        ),

        Doctor(
            name: "Dr. Noor Alqahtani",
            specialty: "Consultant Ophthalmology",
            hospital: "Al Habib Medical Center – Al Takhassusi",
            intro: "Consultant Ophthalmology providing medical and surgical eye care. Extensive experience in cataract surgery and long-term vision care.",
            rating: 4.2,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 21,
            patientsServed: 4800
        ),

        Doctor(
            name: "Dr. Raghad Alzahrani",
            specialty: "Consultant Psychiatry",
            hospital: "Al Habib Medical Center – Al Takhassusi",
            intro: "Consultant Psychiatry providing mental health assessment and treatment. Committed to mental wellness and personalized therapeutic plans.",
            rating: 4.8,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 11,
            patientsServed: 3950
        ),

        Doctor(
            name: "Dr. Abdulrahman Alghamdi",
            specialty: "Consultant Internal Medicine",
            hospital: "King Salman Hospital",
            intro: "Consultant Internal Medicine managing chronic medical conditions. Expertise in managing chronic diseases and complex medical conditions.",
            rating: 4.3,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 15,
            patientsServed: 4450
        ),

        Doctor(
            name: "Dr. Khaled Alzahrani",
            specialty: "Consultant Cardiology",
            hospital: "King Salman Hospital",
            intro: "Consultant Cardiology focusing on non-invasive cardiac care. Expert in cardiovascular health and preventive heart care.",
            rating: 4.0,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 19,
            patientsServed: 4300
        ),

        Doctor(
            name: "Dr. Faisal Almutairi",
            specialty: "Consultant Urology",
            hospital: "King Salman Hospital",
            intro: "Consultant Neurology treating headaches and seizure disorders. Dedicated to providing comprehensive urological care.",
            rating: 3.7,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 22,
            patientsServed: 6250
        ),

        Doctor(
            name: "Dr. Huda Alqahtani",
            specialty: "Consultant Dermatology",
            hospital: "King Salman Hospital",
            intro: "Consultant Dermatology providing medical skin treatments. Has helped hundreds of patients successfully manage acne, eczema, and chronic skin conditions.",
            rating: 3.6,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 15,
            patientsServed: 3050
        ),

        Doctor(
            name: "Dr. Yasser Alsubaie",
            specialty: "Consultant ENT",
            hospital: "King Salman Hospital",
            intro: "Consultant Gastroenterology experienced in endoscopy services. Specializing in conditions affecting the ear, nose, and throat.",
            rating: 3.7,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 15,
            patientsServed: 3400
        ),

        Doctor(
            name: "Dr. Mona Alenezi",
            specialty: "Consultant Endocrinology",
            hospital: "King Salman Hospital",
            intro: "Consultant Endocrinology managing diabetes and thyroid disorders. Expert in hormonal balance and diabetes management.",
            rating: 3.8,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 20,
            patientsServed: 5300
        ),

        Doctor(
            name: "Dr. Laila Almutairi",
            specialty: "Consultant Family Medicine",
            hospital: "King Salman Hospital",
            intro: "Consultant Family Medicine providing primary care services. Focused on comprehensive health management for the whole family.",
            rating: 4.0,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 18,
            patientsServed: 5700
        ),

        Doctor(
            name: "Dr. Ahmed Alqahtani",
            specialty: "Consultant General Surgery",
            hospital: "Al Iman General Hospital",
            intro: "Consultant General Surgery specializing in laparoscopic surgery. Performed numerous successful procedures with a focus on patient safety and recovery.",
            rating: 3.7,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 20,
            patientsServed: 5000
        ),

        Doctor(
            name: "Dr. Rania Alotaibi",
            specialty: "Consultant Radiology",
            hospital: "Al Iman General Hospital",
            intro: "Consultant Radiology specializing in diagnostic imaging.",
            rating: 4.1,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 16,
            patientsServed: 4750
        ),

        Doctor(
            name: "Dr. Noor Alharbi",
            specialty: "Consultant Ophthalmology",
            hospital: "Al Iman General Hospital",
            intro: "Consultant Ophthalmology providing comprehensive eye care. Extensive experience in cataract surgery and long-term vision care.",
            rating: 3.9,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 18,
            patientsServed: 5900
        ),

        Doctor(
            name: "Dr. Abdulrahman Alsubaie",
            specialty: "Consultant Internal Medicine",
            hospital: "Al Yamamah Hospital",
            intro: "Consultant Internal Medicine with experience in chronic disease management. Expertise in managing chronic diseases and complex medical conditions.",
            rating: 4.0,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 19,
            patientsServed: 5300
        ),

        Doctor(
            name: "Dr. Reem Alotaibi",
            specialty: "Consultant OB-GYN",
            hospital: "Al Yamamah Hospital",
            intro: "Consultant Obstetrics & Gynecology providing antenatal and delivery care. Providing comprehensive care for women's health and wellness.",
            rating: 3.8,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 17,
            patientsServed: 3800
        ),

        Doctor(
            name: "Dr. Nasser Alzahrani",
            specialty: "Consultant Orthopedics",
            hospital: "Al Yamamah Hospital",
            intro: "Consultant Orthopedic Surgery specializing in trauma and fractures. Specializing in musculoskeletal health and recovery from sports injuries.",
            rating: 4.0,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 11,
            patientsServed: 2500
        ),

        Doctor(
            name: "Dr. Huda Almutairi",
            specialty: "Consultant Dermatology",
            hospital: "Al Yamamah Hospital",
            intro: "Consultant Dermatology providing medical dermatology services. Has helped hundreds of patients successfully manage acne, eczema, and chronic skin conditions.",
            rating: 3.9,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 20,
            patientsServed: 6350
        ),

        Doctor(
            name: "Dr. Mona Alqahtani",
            specialty: "Consultant Endocrinology",
            hospital: "Al Yamamah Hospital",
            intro: "Consultant Endocrinology managing diabetes and thyroid disorders. Expert in hormonal balance and diabetes management.",
            rating: 3.8,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 15,
            patientsServed: 5200
        ),

        Doctor(
            name: "Dr. Saeed Alenezi",
            specialty: "Consultant Pulmonology",
            hospital: "Al Yamamah Hospital",
            intro: "Consultant Pulmonology treating asthma and chronic lung disease. Expert in respiratory health and lung conditions.",
            rating: 3.8,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 17,
            patientsServed: 6350
        ),

        Doctor(
            name: "Dr. Sara Alsubaie",
            specialty: "Consultant Pediatrics",
            hospital: "Dar Al Shifa Hospital",
            intro: "Consultant Pediatrics with experience in child growth and development. Known for a compassionate approach to child healthcare and family guidance.",
            rating: 4.5,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 22,
            patientsServed: 6950
        ),

        Doctor(
            name: "Dr. Bandar Alotaibi",
            specialty: "Consultant ENT",
            hospital: "Dar Al Shifa Hospital",
            intro: "Consultant ENT managing sinus and hearing disorders. Specializing in conditions affecting the ear, nose, and throat.",
            rating: 4.6,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 13,
            patientsServed: 5600
        ),

        Doctor(
            name: "Dr. Majed Alghamdi",
            specialty: "Consultant Anesthesiology",
            hospital: "Dar Al Shifa Hospital",
            intro: "Consultant Anesthesiology with perioperative care experience.",
            rating: 4.1,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 16,
            patientsServed: 5300
        ),

        Doctor(
            name: "Dr. Noor Alsubaie",
            specialty: "Consultant Ophthalmology",
            hospital: "Dar Al Shifa Hospital",
            intro: "Consultant Ophthalmology providing medical and surgical eye care. Extensive experience in cataract surgery and long-term vision care.",
            rating: 3.8,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 13,
            patientsServed: 3450
        ),

        Doctor(
            name: "Dr. Hassan Alharbi",
            specialty: "Consultant Emergency Medicine",
            hospital: "Dar Al Shifa Hospital",
            intro: "Consultant Emergency Medicine with trauma care experience.",
            rating: 3.7,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 18,
            patientsServed: 5050
        ),

        Doctor(
            name: "Dr. Raghad Almutairi",
            specialty: "Consultant Psychiatry",
            hospital: "Dar Al Shifa Hospital",
            intro: "Consultant Psychiatry providing mental health assessment and treatment. Committed to mental wellness and personalized therapeutic plans.",
            rating: 4.2,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 17,
            patientsServed: 3950
        ),

        Doctor(
            name: "Dr. Khaled Alsubaie",
            specialty: "Consultant Cardiology",
            hospital: "Al Faisal Specialist Hospital",
            intro: "Consultant Cardiology focusing on cardiac diagnostics and prevention. Expert in cardiovascular health and preventive heart care.",
            rating: 4.6,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 17,
            patientsServed: 4650
        ),

        Doctor(
            name: "Dr. Saeed Alotaibi",
            specialty: "Consultant Pulmonology",
            hospital: "King Khalid University Hospital",
            intro: "Consultant Pulmonology treating asthma and COPD. Expert in respiratory health and lung conditions.",
            rating: 4.1,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 19,
            patientsServed: 6100
        ),

        Doctor(
            name: "Dr. Rania Almutairi",
            specialty: "Consultant Radiology",
            hospital: "Dr. Sulaiman Al Habib Hospital – Al Suwaidi",
            intro: "Consultant Radiology specializing in CT and MRI imaging.",
            rating: 4.5,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 11,
            patientsServed: 4550
        ),

        Doctor(
            name: "Dr. Hassan Alenezi",
            specialty: "Consultant Emergency Medicine",
            hospital: "Mouwasat Hospital",
            intro: "Consultant Emergency Medicine with trauma experience.",
            rating: 4.9,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 14,
            patientsServed: 5200
        ),

        Doctor(
            name: "Dr. Raghad Alsubaie",
            specialty: "Consultant Psychiatry",
            hospital: "Mouwasat Hospital",
            intro: "Consultant Psychiatry providing mental health treatment. Committed to mental wellness and personalized therapeutic plans.",
            rating: 3.9,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree",
            languages: ["Arabic", "English"],
            experience: 10,
            patientsServed: 3550
        ),

        Doctor(
            name: "Dr. Abdulmalik Alruhaimi",
            specialty: "Consultant Radiology",
            hospital: "King Fahad Medical City",
            intro: "Consultant radiologist specialized in CT and MRI interpretation, with strong clinical correlation to support accurate diagnosis.",
            rating: 5,
            imageName: "person.crop.circle.fill",
            education: "Medical Degree (Radiology Residency)",
            languages: ["Arabic", "English"],
            experience: 23,
            patientsServed: 2850
        ),

        Doctor(
            name: "Dr. Maria Santos",
            specialty: "Consultant Family Medicine",
            hospital: "KIMSHEALTH Medical Center (Jarir)",
            intro: "Provides primary care consultations, chronic disease follow-up, and preventive screenings.",
            rating: 4.0,
            imageName: "person.crop.circle.fill",
            education: "MD – Family Medicine",
            languages: ["English", "Tagalog"],
            experience: 13,
            patientsServed: 4100
        ),

        Doctor(
            name: "Dr. Ahmed Hassan",
            specialty: "Consultant Internal Medicine",
            hospital: "Al Hammadi Hospital – Olaya",
            intro: "Experienced in evaluating fatigue, infections, and chronic medical conditions.",
            rating: 4.6,
            imageName: "person.crop.circle.fill",
            education: "MD – Internal Medicine",
            languages: ["Arabic", "English"],
            experience: 15,
            patientsServed: 3850
        ),

        Doctor(
            name: "Dr. Priya Menon",
            specialty: "Dermatology Specialist",
            hospital: "Dallah Hospital",
            intro: "Treats acne, pigmentation, eczema, and hair disorders with medical and cosmetic care.",
            rating: 4.2,
            imageName: "person.crop.circle.fill",
            education: "MD – Dermatology",
            languages: ["English", "Hindi"],
            experience: 7,
            patientsServed: 2500
        ),

        Doctor(
            name: "Dr. John Matthews",
            specialty: "Consultant Cardiology",
            hospital: "King Fahad Medical City",
            intro: "Specialized in heart disease prevention, palpitations, and hypertension management.",
            rating: 4.1,
            imageName: "person.crop.circle.fill",
            education: "MD – Cardiology",
            languages: ["English"],
            experience: 18,
            patientsServed: 4750
        ),

        Doctor(
            name: "Dr. Fatima Zahra",
            specialty: "Consultant Pediatrics",
            hospital: "Saudi German Hospital",
            intro: "Child health specialist focusing on infections, growth, and vaccination guidance.",
            rating: 3.8,
            imageName: "person.crop.circle.fill",
            education: "MD – Pediatrics",
            languages: ["Arabic", "French", "English"],
            experience: 14,
            patientsServed: 5500
        ),

        Doctor(
            name: "Dr. Rajesh Kumar",
            specialty: "Consultant Orthopedics",
            hospital: "Prince Sultan Military Medical City",
            intro: "Treats fractures, joint pain, and sports injuries with rehabilitation planning.",
            rating: 4.2,
            imageName: "person.crop.circle.fill",
            education: "MS – Orthopedic Surgery",
            languages: ["English", "Hindi"],
            experience: 16,
            patientsServed: 5250
        ),

        Doctor(
            name: "Dr. Nooruddin Khan",
            specialty: "Consultant Pulmonology",
            hospital: "King Salman Hospital",
            intro: "Manages asthma, chronic cough, and breathing disorders with inhaler education.",
            rating: 4.9,
            imageName: "person.crop.circle.fill",
            education: "MD – Pulmonology",
            languages: ["English", "Urdu"],
            experience: 15,
            patientsServed: 6000
        ),

        Doctor(
            name: "Dr. Elena Petrova",
            specialty: "Consultant Neurology",
            hospital: "King Faisal Specialist Hospital & Research Centre",
            intro: "Evaluates headaches, numbness, and seizure disorders using structured diagnostic plans.",
            rating: 4.0,
            imageName: "person.crop.circle.fill",
            education: "MD – Neurology",
            languages: ["English", "Russian"],
            experience: 22,
            patientsServed: 6200
        ),

        Doctor(
            name: "Dr. Hassan Ali",
            specialty: "Consultant Gastroenterology",
            hospital: "Al Mouwasat Hospital",
            intro: "Treats reflux, IBS symptoms, and abdominal pain with stepwise management.",
            rating: 3.6,
            imageName: "person.crop.circle.fill",
            education: "MD – Gastroenterology",
            languages: ["Arabic", "English"],
            experience: 17,
            patientsServed: 5750
        ),

        Doctor(
            name: "Dr. Grace Dela Cruz",
            specialty: "Clinical Nutritionist",
            hospital: "Care National Hospital",
            intro: "Provides diet plans for weight management, diabetes, and cholesterol control.",
            rating: 3.9,
            imageName: "person.crop.circle.fill",
            education: "BS Clinical Nutrition",
            languages: ["English", "Tagalog"],
            experience: 16,
            patientsServed: 5050
        ),

        Doctor(
            name: "Dr. Omar Farouk",
            specialty: "Consultant Urology",
            hospital: "Kingdom Hospital & Consulting Clinics",
            intro: "Treats urinary infections, kidney stones, and prostate symptoms.",
            rating: 3.7,
            imageName: "person.crop.circle.fill",
            education: "MD – Urology",
            languages: ["Arabic", "English"],
            experience: 16,
            patientsServed: 6700
        ),

        Doctor(
            name: "Dr. Aisha Rahman",
            specialty: "Consultant Psychiatry",
            hospital: "King Khalid University Hospital",
            intro: "Supports patients with anxiety, depression, and sleep disorders.",
            rating: 3.6,
            imageName: "person.crop.circle.fill",
            education: "MD – Psychiatry",
            languages: ["English", "Urdu"],
            experience: 18,
            patientsServed: 6200
        ),

        Doctor(
            name: "Dr. Miguel Fernandez",
            specialty: "Consultant Emergency Medicine",
            hospital: "King Saud Medical City",
            intro: "Handles urgent symptoms and injury assessments with fast triage decisions.",
            rating: 4.4,
            imageName: "person.crop.circle.fill",
            education: "MD – Emergency Medicine",
            languages: ["English", "Spanish"],
            experience: 21,
            patientsServed: 5150
        ),

        Doctor(
            name: "Dr. Lina Haddad",
            specialty: "Consultant Obstetrics & Gynecology",
            hospital: "Dr. Sulaiman Al Habib Medical Group",
            intro: "Provides antenatal care, hormonal evaluation, and gynecological follow-ups.",
            rating: 4.0,
            imageName: "person.crop.circle.fill",
            education: "MD – OB/GYN",
            languages: ["Arabic", "English"],
            experience: 15,
            patientsServed: 4000
        ),

        Doctor(
            name: "Dr. Peter Novak",
            specialty: "Consultant Radiology",
            hospital: "King Fahad Medical City",
            intro: "Specialist in MRI and CT diagnostic imaging interpretation.",
            rating: 3.9,
            imageName: "person.crop.circle.fill",
            education: "MD – Radiology",
            languages: ["English", "Czech"],
            experience: 19,
            patientsServed: 5000
        ),

        Doctor(
            name: "Dr. Mohammed Al-Sayed",
            specialty: "Consultant ENT",
            hospital: "Riyadh Care Hospital",
            intro: "Treats sinusitis, ear infections, and throat disorders.",
            rating: 3.9,
            imageName: "person.crop.circle.fill",
            education: "MD – ENT",
            languages: ["Arabic", "English"],
            experience: 15,
            patientsServed: 4100
        ),

        Doctor(
            name: "Dr. Kevin O'Brien",
            specialty: "Consultant Cardiology",
            hospital: "King Fahad Medical City",
            intro: "Evaluates chest pain, heart rhythm issues, and long-term cardiovascular risk.",
            rating: 4.5,
            imageName: "person.crop.circle.fill",
            education: "MD – Cardiology",
            languages: ["English"],
            experience: 14,
            patientsServed: 5350
        ),

        Doctor(
            name: "Dr. Nour Khalil",
            specialty: "Consultant Dermatology",
            hospital: "Al Hammadi Hospital – Olaya",
            intro: "Treats acne, dermatitis, and chronic skin irritation with practical care plans.",
            rating: 4.4,
            imageName: "person.crop.circle.fill",
            education: "MD – Dermatology",
            languages: ["Arabic", "English"],
            experience: 11,
            patientsServed: 4050
        ),

        Doctor(
            name: "Dr. Sameer Patel",
            specialty: "Consultant Internal Medicine",
            hospital: "Dallah Hospital",
            intro: "Manages chronic diseases, fatigue assessment, and preventive screenings.",
            rating: 4.0,
            imageName: "person.crop.circle.fill",
            education: "MD – Internal Medicine",
            languages: ["English", "Hindi"],
            experience: 11,
            patientsServed: 4800
        ),

        Doctor(
            name: "Dr. Hannah Schmidt",
            specialty: "Consultant Neurology",
            hospital: "King Faisal Specialist Hospital & Research Centre",
            intro: "Evaluates headaches, numbness, and neurological disorders.",
            rating: 3.8,
            imageName: "person.crop.circle.fill",
            education: "MD – Neurology",
            languages: ["English", "German"],
            experience: 13,
            patientsServed: 3750
        ),

        Doctor(
            name: "Dr. Bilal Mahmoud",
            specialty: "Consultant Gastroenterology",
            hospital: "Al Mouwasat Hospital",
            intro: "Treats reflux, bloating, and digestive discomfort with structured plans.",
            rating: 4.8,
            imageName: "person.crop.circle.fill",
            education: "MD – Gastroenterology",
            languages: ["Arabic", "English"],
            experience: 10,
            patientsServed: 4250
        ),

        Doctor(
            name: "Dr. Sophia Rossi",
            specialty: "Consultant Ophthalmology",
            hospital: "Saudi German Hospital",
            intro: "Provides comprehensive eye exams and treats infections and dryness.",
            rating: 3.9,
            imageName: "person.crop.circle.fill",
            education: "MD – Ophthalmology",
            languages: ["English", "Italian"],
            experience: 21,
            patientsServed: 6000
        ),

        Doctor(
            name: "Dr. Tariq Jaber",
            specialty: "Consultant Urology",
            hospital: "Kingdom Hospital & Consulting Clinics",
            intro: "Treats urinary symptoms and kidney stones with clear evaluation steps.",
            rating: 4.3,
            imageName: "person.crop.circle.fill",
            education: "MD – Urology",
            languages: ["Arabic", "English"],
            experience: 16,
            patientsServed: 6250
        ),

        Doctor(
            name: "Dr. Daniel Park",
            specialty: "Consultant Orthopedics",
            hospital: "Prince Sultan Military Medical City",
            intro: "Handles joint injuries, fractures, and mobility rehabilitation.",
            rating: 4.5,
            imageName: "person.crop.circle.fill",
            education: "MD – Orthopedic Surgery",
            languages: ["English", "Korean"],
            experience: 15,
            patientsServed: 3550
        ),

        Doctor(
            name: "Dr. Mariam Yusuf",
            specialty: "Consultant Pediatrics",
            hospital: "King Salman Hospital",
            intro: "Focuses on childhood infections, vaccinations, and growth monitoring.",
            rating: 4.2,
            imageName: "person.crop.circle.fill",
            education: "MD – Pediatrics",
            languages: ["Arabic", "English"],
            experience: 19,
            patientsServed: 5450
        ),

        Doctor(
            name: "Dr. Victor Hernandez",
            specialty: "Consultant Emergency Medicine",
            hospital: "King Saud Medical City",
            intro: "Evaluates urgent conditions and injuries with safe triage decisions.",
            rating: 3.8,
            imageName: "person.crop.circle.fill",
            education: "MD – Emergency Medicine",
            languages: ["English", "Spanish"],
            experience: 12,
            patientsServed: 5050
        ),

        Doctor(
            name: "Dr. Amina Idris",
            specialty: "Consultant Psychiatry",
            hospital: "King Khalid University Hospital",
            intro: "Treats anxiety, depression, and sleep disorders with supportive therapy.",
            rating: 4.8,
            imageName: "person.crop.circle.fill",
            education: "MD – Psychiatry",
            languages: ["Arabic", "English"],
            experience: 16,
            patientsServed: 4350
        ),

        Doctor(
            name: "Dr. Joseph Tan",
            specialty: "Consultant Pulmonology",
            hospital: "Care National Hospital",
            intro: "Manages asthma and chronic breathing conditions with inhaler guidance.",
            rating: 3.6,
            imageName: "person.crop.circle.fill",
            education: "MD – Pulmonology",
            languages: ["English"],
            experience: 17,
            patientsServed: 6700
        ),

        Doctor(
            name: "Dr. Layla Saidi",
            specialty: "Consultant Rheumatology",
            hospital: "National Guard Health Affairs",
            intro: "Treats arthritis and autoimmune joint diseases with long-term follow-up.",
            rating: 3.8,
            imageName: "person.crop.circle.fill",
            education: "MD – Rheumatology",
            languages: ["Arabic", "French", "English"],
            experience: 21,
            patientsServed: 5300
        ),

        Doctor(
            name: "Dr. Mohamed Elbanna",
            specialty: "Consultant Radiology",
            hospital: "King Fahad Medical City",
            intro: "Interprets CT and MRI imaging with detailed reporting.",
            rating: 4.1,
            imageName: "person.crop.circle.fill",
            education: "MD – Radiology",
            languages: ["Arabic", "English"],
            experience: 20,
            patientsServed: 6600
        ),

        Doctor(
            name: "Dr. Chloe Dubois",
            specialty: "Consultant Endocrinology",
            hospital: "King Saud Medical City",
            intro: "Treats diabetes and thyroid disorders with lifestyle guidance.",
            rating: 4.6,
            imageName: "person.crop.circle.fill",
            education: "MD – Endocrinology",
            languages: ["English", "French"],
            experience: 11,
            patientsServed: 4050
        ),

        Doctor(
            name: "Dr. Farhan Qureshi",
            specialty: "Consultant Hematology",
            hospital: "King Faisal Specialist Hospital & Research Centre",
            intro: "Evaluates anemia and abnormal blood counts.",
            rating: 4.5,
            imageName: "person.crop.circle.fill",
            education: "MD – Hematology",
            languages: ["English", "Urdu"],
            experience: 17,
            patientsServed: 4500
        ),

        Doctor(
            name: "Dr. Nadia Habib",
            specialty: "Consultant Obstetrics & Gynecology",
            hospital: "Dr. Sulaiman Al Habib Medical Group",
            intro: "Provides pregnancy care and gynecological follow-ups.",
            rating: 3.6,
            imageName: "person.crop.circle.fill",
            education: "MD – OB/GYN",
            languages: ["Arabic", "English"],
            experience: 13,
            patientsServed: 3150
        ),

        Doctor(
            name: "Dr. Pavel Ivanov",
            specialty: "Consultant Anesthesiology",
            hospital: "Al Hammadi Hospital – Olaya",
            intro: "Ensures safe anesthesia and perioperative monitoring.",
            rating: 4.1,
            imageName: "person.crop.circle.fill",
            education: "MD – Anesthesiology",
            languages: ["English", "Russian"],
            experience: 21,
            patientsServed: 8350
        ),

        Doctor(
            name: "Dr. Abdullah Noor",
            specialty: "Family Medicine Specialist",
            hospital: "Riyadh Care Hospital",
            intro: "Provides routine checkups and preventive health guidance.",
            rating: 4.4,
            imageName: "person.crop.circle.fill",
            education: "MD – Family Medicine",
            languages: ["Arabic", "English"],
            experience: 7,
            patientsServed: 2350
        ),

        Doctor(
            name: "Dr. Meera Nair",
            specialty: "Clinical Nutritionist",
            hospital: "Saudi German Hospital",
            intro: "Creates diet plans for diabetes and weight management.",
            rating: 3.7,
            imageName: "person.crop.circle.fill",
            education: "BSc Clinical Nutrition",
            languages: ["English", "Hindi"],
            experience: 18,
            patientsServed: 6200
        ),

        Doctor(
            name: "Dr. Omar Bakr",
            specialty: "Consultant General Surgery",
            hospital: "Dar Al Shifa Hospital",
            intro: "Evaluates surgical conditions and minor procedures.",
            rating: 4.0,
            imageName: "person.crop.circle.fill",
            education: "MD – General Surgery",
            languages: ["Arabic", "English"],
            experience: 11,
            patientsServed: 4400
        ),

        Doctor(
            name: "Dr. Stefan Muller",
            specialty: "Consultant Sleep Medicine",
            hospital: "King Fahad Medical City",
            intro: "Treats insomnia and sleep apnea.",
            rating: 4.7,
            imageName: "person.crop.circle.fill",
            education: "MD – Sleep Medicine",
            languages: ["English", "German"],
            experience: 18,
            patientsServed: 4600
        ),

        Doctor(
            name: "Dr. Ritu Sharma",
            specialty: "Allergy & Immunology Consultant",
            hospital: "Dallah Hospital",
            intro: "Treats allergies and chronic urticaria.",
            rating: 4.6,
            imageName: "person.crop.circle.fill",
            education: "MD – Allergy & Immunology",
            languages: ["English", "Hindi"],
            experience: 16,
            patientsServed: 4550
        ),

        Doctor(
            name: "Dr. Hassan Karim",
            specialty: "Consultant Nephrology",
            hospital: "King Saud Medical City",
            intro: "Treats kidney disease and electrolyte imbalance.",
            rating: 3.8,
            imageName: "person.crop.circle.fill",
            education: "MD – Nephrology",
            languages: ["Arabic", "English"],
            experience: 21,
            patientsServed: 6950
        ),

        Doctor(
            name: "Dr. Lucas Pereira",
            specialty: "Pain Management Consultant",
            hospital: "Care National Hospital",
            intro: "Manages chronic nerve and back pain.",
            rating: 4.4,
            imageName: "person.crop.circle.fill",
            education: "MD – Pain Medicine",
            languages: ["English", "Portuguese"],
            experience: 13,
            patientsServed: 3550
        ),

        Doctor(
            name: "Dr. Yasmin Nasser",
            specialty: "Consultant ENT",
            hospital: "Kingdom Hospital & Consulting Clinics",
            intro: "Treats sinus, throat, and ear disorders.",
            rating: 3.8,
            imageName: "person.crop.circle.fill",
            education: "MD – ENT",
            languages: ["Arabic", "English"],
            experience: 17,
            patientsServed: 3700
        ),

        Doctor(
            name: "Dr. Robert King",
            specialty: "Consultant Oncology",
            hospital: "King Faisal Specialist Hospital & Research Centre",
            intro: "Provides cancer treatment planning and monitoring.",
            rating: 4.5,
            imageName: "person.crop.circle.fill",
            education: "MD – Oncology",
            languages: ["English"],
            experience: 16,
            patientsServed: 6250
        ),

        Doctor(
            name: "Dr. Hala Tarek",
            specialty: "Consultant Dermatology",
            hospital: "Al Mouwasat Hospital",
            intro: "Treats pigmentation and chronic skin conditions.",
            rating: 3.7,
            imageName: "person.crop.circle.fill",
            education: "MD – Dermatology",
            languages: ["Arabic", "English"],
            experience: 19,
            patientsServed: 5300
        ),

        Doctor(
            name: "Dr. Chen Wei",
            specialty: "Consultant Cardiology",
            hospital: "King Salman Hospital",
            intro: "Manages hypertension and heart rhythm problems.",
            rating: 3.6,
            imageName: "person.crop.circle.fill",
            education: "MD – Cardiology",
            languages: ["English", "Chinese"],
            experience: 13,
            patientsServed: 4850
        ),

        Doctor(
            name: "Dr. Mustafa Arslan",
            specialty: "Consultant Neurology",
            hospital: "Prince Sultan Military Medical City",
            intro: "Evaluates dizziness and nerve disorders.",
            rating: 3.8,
            imageName: "person.crop.circle.fill",
            education: "MD – Neurology",
            languages: ["English", "Turkish"],
            experience: 10,
            patientsServed: 2350
        ),

        Doctor(
            name: "Dr. Carla Mendes",
            specialty: "Consultant Pediatrics",
            hospital: "King Saud Medical City",
            intro: "Treats childhood infections and growth concerns.",
            rating: 4.1,
            imageName: "person.crop.circle.fill",
            education: "MD – Pediatrics",
            languages: ["English", "Portuguese"],
            experience: 13,
            patientsServed: 4300
        ),

        Doctor(
            name: "Dr. Wael Hammad",
            specialty: "Consultant Gastroenterology",
            hospital: "Riyadh Care Hospital",
            intro: "Treats stomach pain and digestive disorders.",
            rating: 3.6,
            imageName: "person.crop.circle.fill",
            education: "MD – Gastroenterology",
            languages: ["Arabic", "English"],
            experience: 22,
            patientsServed: 4800
        ),

        Doctor(
            name: "Dr. Adeel Khan",
            specialty: "Consultant Pulmonology",
            hospital: "Al Hammadi Hospital – Olaya",
            intro: "Treats chronic cough and asthma.",
            rating: 3.7,
            imageName: "person.crop.circle.fill",
            education: "MD – Pulmonology",
            languages: ["English", "Urdu"],
            experience: 21,
            patientsServed: 6700
        ),

        Doctor(
            name: "Dr. Emily Carter",
            specialty: "Family Medicine Specialist",
            hospital: "Care National Hospital",
            intro: "Primary care for adults and children.",
            rating: 4.3,
            imageName: "person.crop.circle.fill",
            education: "MD – Family Medicine",
            languages: ["English"],
            experience: 14,
            patientsServed: 4400
        ),

        Doctor(
            name: "Dr. Abdullah Rashid",
            specialty: "Consultant Urology",
            hospital: "Dallah Hospital",
            intro: "Treats urinary tract conditions and stones.",
            rating: 4.2,
            imageName: "person.crop.circle.fill",
            education: "MD – Urology",
            languages: ["Arabic", "English"],
            experience: 13,
            patientsServed: 2950
        ),

        Doctor(
            name: "Dr. Noor Habiba",
            specialty: "Consultant Psychiatry",
            hospital: "King Khalid University Hospital",
            intro: "Treats anxiety and mood disorders.",
            rating: 4.7,
            imageName: "person.crop.circle.fill",
            education: "MD – Psychiatry",
            languages: ["Arabic", "English"],
            experience: 14,
            patientsServed: 3000
        ),

        Doctor(
            name: "Dr. Patrick Silva",
            specialty: "Consultant Emergency Medicine",
            hospital: "King Saud Medical City",
            intro: "Handles urgent symptoms and trauma cases.",
            rating: 3.7,
            imageName: "person.crop.circle.fill",
            education: "MD – Emergency Medicine",
            languages: ["English", "Spanish"],
            experience: 10,
            patientsServed: 3350
        ),

        Doctor(
            name: "Dr. Ibrahim Adel",
            specialty: "Consultant Orthopedics",
            hospital: "Al Mouwasat Hospital",
            intro: "Treats joint injuries and fractures.",
            rating: 4.2,
            imageName: "person.crop.circle.fill",
            education: "MD – Orthopedic Surgery",
            languages: ["Arabic", "English"],
            experience: 12,
            patientsServed: 4550
        ),

        Doctor(
            name: "Dr. Linda Wong",
            specialty: "Consultant Radiology",
            hospital: "King Fahad Medical City",
            intro: "Provides diagnostic imaging interpretation.",
            rating: 4.0,
            imageName: "person.crop.circle.fill",
            education: "MD – Radiology",
            languages: ["English", "Chinese"],
            experience: 16,
            patientsServed: 4900
        ),

        Doctor(
            name: "Dr. Bader Abu Baker",
            specialty: "Consultant Pediatric Endocrinology and Diabetes",
            hospital: "Dr. Sulaiman Al Habib Medical Group",
            intro: "Consultant in pediatric endocrinology and diabetes with 14 years of experience in managing hormonal and diabetes conditions in children.",
            rating: 5,
            imageName: "person.crop.circle.fill",
            education: "MD – Pediatric Endocrinology and Diabetes",
            languages: ["Arabic", "English"],
            experience: 14,
            patientsServed: 4900
        ),

        Doctor(
            name: "Dr. Reem Almuhanna",
            specialty: "Health Educator",
            hospital: "Dr. Sulaiman Al Habib Medical Group",
            intro: "Provides health education and guidance for diabetes management across all ages, including glucose monitoring, insulin pump training, and carbohydrate counting",
            rating: 4.9,
            imageName: "person.crop.circle.fill",
            education: "Health Education",
            languages: ["Arabic", "English"],
            experience: 9,
            patientsServed: 2600
        ),

        Doctor(
            name: "Dr. Turki Al-Rashidi",
            specialty: "Consultant Dentistry – Orthodontics",
            hospital: "Specialized Dental Center – Riyadh",
            intro: "Orthodontist with 15 years of experience in braces, clear aligners, and jaw alignment correction for adults and children.",
            rating: 4.0,
            imageName: "person.crop.circle.fill",
            education: "BDS, MOrth – Orthodontics",
            languages: ["Arabic", "English"],
            experience: 21,
            patientsServed: 7250
        ),

        Doctor(
            name: "Dr. Olivia Chen",
            specialty: "Consultant Dentistry – Prosthodontics",
            hospital: "Riyadh Dental & Maxillofacial Center",
            intro: "Prosthodontist specializing in dental implants, crowns, and full-mouth rehabilitation.",
            rating: 4.3,
            imageName: "person.crop.circle.fill",
            education: "BDS, MSc – Prosthodontics",
            languages: ["English", "Chinese", "Arabic"],
            experience: 15,
            patientsServed: 5600
        ),

        Doctor(
            name: "Dr. Faisal Al-Dosari",
            specialty: "Consultant Dentistry – Oral & Maxillofacial Surgery",
            hospital: "King Abdullah Medical Complex – Riyadh",
            intro: "Oral and maxillofacial surgeon experienced in wisdom tooth extraction, jaw surgery, and facial trauma repair.",
            rating: 4.4,
            imageName: "person.crop.circle.fill",
            education: "BDS, FDSRCS – Oral Surgery",
            languages: ["Arabic", "English"],
            experience: 17,
            patientsServed: 4200
        ),

        Doctor(
            name: "Dr. Preethi Subramaniam",
            specialty: "Consultant Dentistry – Periodontics",
            hospital: "Gulf Dental Specialist Clinic – Riyadh",
            intro: "Periodontist treating gum disease, bone loss, and providing implant placement with a focus on long-term oral health.",
            rating: 3.7,
            imageName: "person.crop.circle.fill",
            education: "BDS, MDS – Periodontics",
            languages: ["English", "Tamil", "Arabic"],
            experience: 20,
            patientsServed: 6500
        ),

        Doctor(
            name: "Dr. Abdulaziz Bin Nasser",
            specialty: "Consultant Dentistry – Endodontics",
            hospital: "Al Noor Specialist Dental Clinic – Riyadh",
            intro: "Endodontist performing root canal treatments and retreatments using advanced microscope-guided techniques.",
            rating: 4.9,
            imageName: "person.crop.circle.fill",
            education: "BDS, MSc – Endodontics",
            languages: ["Arabic", "English"],
            experience: 15,
            patientsServed: 5750
        ),

        Doctor(
            name: "Dr. Karim Mansour",
            specialty: "Consultant Neurology",
            hospital: "Riyadh Neuroscience Institute",
            intro: "Neurologist specializing in stroke management, epilepsy, and multiple sclerosis with 16 years of clinical experience.",
            rating: 4.7,
            imageName: "person.crop.circle.fill",
            education: "MD – Neurology, Fellowship in Stroke",
            languages: ["Arabic", "French", "English"],
            experience: 19,
            patientsServed: 4700
        ),

        Doctor(
            name: "Dr. Sunita Krishnamurthy",
            specialty: "Consultant Neurology",
            hospital: "Al Salama Hospital – Riyadh",
            intro: "Neurologist with expertise in Parkinson's disease, dementia, and movement disorders.",
            rating: 3.6,
            imageName: "person.crop.circle.fill",
            education: "MD – Neurology",
            languages: ["English", "Hindi", "Arabic"],
            experience: 13,
            patientsServed: 5150
        ),

        Doctor(
            name: "Dr. Walid Barakat",
            specialty: "Consultant Neurology",
            hospital: "Saudi Neuroscience Center – Riyadh",
            intro: "Neurologist focused on headache disorders, including migraines and cluster headaches, with advanced botulinum therapy experience.",
            rating: 4.7,
            imageName: "person.crop.circle.fill",
            education: "MD – Neurology",
            languages: ["Arabic", "English"],
            experience: 11,
            patientsServed: 3850
        ),

        Doctor(
            name: "Dr. Amal Al-Rashidi",
            specialty: "Consultant Nephrology",
            hospital: "Kidney Care Center – Al Olaya, Riyadh",
            intro: "Nephrologist managing chronic kidney disease, hypertensive nephropathy, and dialysis access with 14 years of experience.",
            rating: 4.4,
            imageName: "person.crop.circle.fill",
            education: "MD – Nephrology",
            languages: ["Arabic", "English"],
            experience: 17,
            patientsServed: 7100
        ),

        Doctor(
            name: "Dr. James Okafor",
            specialty: "Consultant Nephrology",
            hospital: "New Jeddah Clinic Hospital – Riyadh Branch",
            intro: "Nephrologist with extensive experience in glomerulonephritis and renal transplant follow-up care.",
            rating: 4.1,
            imageName: "person.crop.circle.fill",
            education: "MD – Nephrology",
            languages: ["English", "Yoruba"],
            experience: 11,
            patientsServed: 2500
        ),

        Doctor(
            name: "Dr. Sara Al-Enezi",
            specialty: "Consultant Nephrology",
            hospital: "Hera General Hospital – Riyadh",
            intro: "Pediatric and adult nephrologist with experience in dialysis management and lupus nephritis.",
            rating: 4.2,
            imageName: "person.crop.circle.fill",
            education: "MD – Nephrology",
            languages: ["Arabic", "English"],
            experience: 10,
            patientsServed: 3400
        ),

        Doctor(
            name: "Dr. Mohammed Al-Ghamdi",
            specialty: "Consultant Gastroenterology",
            hospital: "Gastro & Liver Center – Riyadh",
            intro: "Gastroenterologist experienced in advanced endoscopy, inflammatory bowel disease, and hepatitis management.",
            rating: 4.3,
            imageName: "person.crop.circle.fill",
            education: "MD – Gastroenterology & Hepatology",
            languages: ["Arabic", "English"],
            experience: 18,
            patientsServed: 7700
        ),

        Doctor(
            name: "Dr. Lena Fischer",
            specialty: "Consultant Gastroenterology",
            hospital: "National Hospital",
            intro: "Gastroenterologist specializing in celiac disease, GERD, and colorectal cancer screening.",
            rating: 3.7,
            imageName: "person.crop.circle.fill",
            education: "MD – Gastroenterology",
            languages: ["English", "German", "Arabic"],
            experience: 16,
            patientsServed: 4000
        ),

        Doctor(
            name: "Dr. Tariq Al-Harbi",
            specialty: "Consultant Gastroenterology",
            hospital: "Dr. Erfan & Bagedo General Hospital – Riyadh",
            intro: "Hepatologist and gastroenterologist with expertise in liver cirrhosis, fatty liver disease, and ERCP procedures.",
            rating: 4.4,
            imageName: "person.crop.circle.fill",
            education: "MD – Hepatology & Gastroenterology",
            languages: ["Arabic", "English"],
            experience: 20,
            patientsServed: 4750
        ),

        Doctor(
            name: "Dr. Noura Al-Qahtani",
            specialty: "Consultant Oncology",
            hospital: "Riyadh Oncology Center",
            intro: "Medical oncologist specializing in breast and gynecologic cancers with experience in immunotherapy and targeted therapy.",
            rating: 4.6,
            imageName: "person.crop.circle.fill",
            education: "MD – Medical Oncology",
            languages: ["Arabic", "English"],
            experience: 12,
            patientsServed: 3600
        ),

        Doctor(
            name: "Dr. Ivan Petrov",
            specialty: "Consultant Oncology – Radiation",
            hospital: "King Abdullah Cancer Center – Riyadh",
            intro: "Radiation oncologist with experience in stereotactic radiosurgery, IMRT, and palliative radiotherapy.",
            rating: 3.5,
            imageName: "person.crop.circle.fill",
            education: "MD – Radiation Oncology",
            languages: ["English", "Russian"],
            experience: 17,
            patientsServed: 5400
        ),

        Doctor(
            name: "Dr. Dina Kamel",
            specialty: "Consultant Oncology",
            hospital: "Saudi German Hospital",
            intro: "Oncologist with expertise in lung and colorectal cancers, clinical trial enrollment, and palliative care coordination.",
            rating: 4.5,
            imageName: "person.crop.circle.fill",
            education: "MD – Medical Oncology",
            languages: ["Arabic", "English", "French"],
            experience: 20,
            patientsServed: 6050
        ),

        Doctor(
            name: "Dr. Saud Al-Mutairi",
            specialty: "Consultant Plastic & Reconstructive Surgery",
            hospital: "Aesthetic Surgery Center – Riyadh",
            intro: "Plastic surgeon specializing in reconstructive procedures, burn repair, and cosmetic surgery with 18 years of experience.",
            rating: 4.5,
            imageName: "person.crop.circle.fill",
            education: "MD – Plastic & Reconstructive Surgery",
            languages: ["Arabic", "English"],
            experience: 19,
            patientsServed: 3900
        ),

        Doctor(
            name: "Dr. Natalie Dupont",
            specialty: "Consultant Plastic & Reconstructive Surgery",
            hospital: "Al Hammadi Hospital – Nuzha",
            intro: "Plastic and reconstructive surgeon with expertise in post-mastectomy reconstruction, scar revision, and rhinoplasty.",
            rating: 3.6,
            imageName: "person.crop.circle.fill",
            education: "MD – Plastic Surgery",
            languages: ["English", "French"],
            experience: 14,
            patientsServed: 4050
        ),

        Doctor(
            name: "Dr. Khaled Al-Sabhan",
            specialty: "Consultant Vascular Surgery",
            hospital: "Heart & Vascular Hospital – Riyadh",
            intro: "Vascular surgeon specializing in aortic aneurysm repair, peripheral artery disease, and varicose vein treatment.",
            rating: 3.7,
            imageName: "person.crop.circle.fill",
            education: "MD – Vascular Surgery",
            languages: ["Arabic", "English"],
            experience: 21,
            patientsServed: 7000
        ),

        Doctor(
            name: "Dr. Marco Rossi",
            specialty: "Consultant Vascular Surgery",
            hospital: "King Salman Cardiovascular Center – Riyadh",
            intro: "Endovascular surgeon experienced in stenting, arteriovenous fistula creation, and limb salvage procedures.",
            rating: 4.4,
            imageName: "person.crop.circle.fill",
            education: "MD – Vascular & Endovascular Surgery",
            languages: ["English", "Italian"],
            experience: 13,
            patientsServed: 3400
        ),

        Doctor(
            name: "Dr. Abdulaziz Al-Osaimi",
            specialty: "Consultant Infectious Disease",
            hospital: "Prince Sattam Bin Abdulaziz University Hospital – Riyadh",
            intro: "Infectious disease specialist managing HIV, tuberculosis, travel medicine, and hospital-acquired infections.",
            rating: 4.8,
            imageName: "person.crop.circle.fill",
            education: "MD – Infectious Disease",
            languages: ["Arabic", "English"],
            experience: 17,
            patientsServed: 4200
        ),

        Doctor(
            name: "Dr. Amelia Foster",
            specialty: "Consultant Infectious Disease",
            hospital: "International Medical Center – Riyadh",
            intro: "Infectious disease consultant with expertise in tropical medicine, sepsis management, and antimicrobial stewardship.",
            rating: 3.5,
            imageName: "person.crop.circle.fill",
            education: "MD – Infectious Disease & Tropical Medicine",
            languages: ["English"],
            experience: 13,
            patientsServed: 3900
        ),

        Doctor(
            name: "Dr. Hessa Al-Dosari",
            specialty: "Consultant Geriatric Medicine",
            hospital: "Riyadh Care Hospital",
            intro: "Geriatrician specializing in cognitive decline, polypharmacy management, fall prevention, and elderly care planning.",
            rating: 3.8,
            imageName: "person.crop.circle.fill",
            education: "MD – Geriatric Medicine",
            languages: ["Arabic", "English"],
            experience: 11,
            patientsServed: 4250
        ),

        Doctor(
            name: "Dr. Thomas Becker",
            specialty: "Consultant Geriatric Medicine",
            hospital: "National Hospital",
            intro: "Geriatric specialist focused on dementia care, rehabilitation after stroke, and multidisciplinary elderly health management.",
            rating: 3.8,
            imageName: "person.crop.circle.fill",
            education: "MD – Geriatrics",
            languages: ["English", "German"],
            experience: 10,
            patientsServed: 2550
        ),

        Doctor(
            name: "Dr. Abdulrahman Al-Shehri",
            specialty: "Consultant Sports Medicine",
            hospital: "Sports Medicine & Rehabilitation Center – Riyadh",
            intro: "Sports medicine physician providing injury prevention, performance optimization, and non-surgical treatment of athletic injuries.",
            rating: 4.7,
            imageName: "person.crop.circle.fill",
            education: "MD – Sports Medicine",
            languages: ["Arabic", "English"],
            experience: 20,
            patientsServed: 4900
        ),

        Doctor(
            name: "Dr. Ana Rodrigues",
            specialty: "Consultant Sports Medicine",
            hospital: "Al Yamamah Hospital",
            intro: "Sports medicine and exercise rehabilitation specialist working with professional and recreational athletes.",
            rating: 4.7,
            imageName: "person.crop.circle.fill",
            education: "MD – Sports & Exercise Medicine",
            languages: ["English", "Portuguese", "Spanish"],
            experience: 13,
            patientsServed: 4750
        ),

        Doctor(
            name: "Dr. Majed Al-Anazi",
            specialty: "Consultant Hematology",
            hospital: "Oncology & Blood Disorders Center – Riyadh",
            intro: "Hematologist managing sickle cell disease, thalassemia, lymphoma, and bone marrow disorders.",
            rating: 4.5,
            imageName: "person.crop.circle.fill",
            education: "MD – Hematology & Oncology",
            languages: ["Arabic", "English"],
            experience: 19,
            patientsServed: 4850
        ),

        Doctor(
            name: "Dr. Yuki Tanaka",
            specialty: "Consultant Hematology",
            hospital: "Al Mouwasat Hospital",
            intro: "Hematologist with expertise in coagulation disorders, thrombosis management, and platelet disorders.",
            rating: 4.0,
            imageName: "person.crop.circle.fill",
            education: "MD – Hematology",
            languages: ["English", "Japanese"],
            experience: 12,
            patientsServed: 4500
        ),

        Doctor(
            name: "Dr. Rakan Al-Mutairi",
            specialty: "Senior Physiotherapist",
            hospital: "Rehabilitation & Physical Therapy Center – Riyadh",
            intro: "Senior physiotherapist specializing in post-surgical rehabilitation, sports injuries, and neurological physiotherapy.",
            rating: 3.6,
            imageName: "person.crop.circle.fill",
            education: "BSc, MSc – Physiotherapy",
            languages: ["Arabic", "English"],
            experience: 20,
            patientsServed: 4700
        ),

        Doctor(
            name: "Ms. Fatima Al-Zahrawi",
            specialty: "Senior Physiotherapist",
            hospital: "King Fahad Medical City",
            intro: "Physiotherapist with expertise in women's health, pelvic floor rehabilitation, and post-partum recovery.",
            rating: 4.5,
            imageName: "person.crop.circle.fill",
            education: "BSc – Physiotherapy",
            languages: ["Arabic", "English"],
            experience: 17,
            patientsServed: 6400
        )
    ]

    static let doctors: [Doctor] = rawDoctors.map(standardized)

    static func doctors(for hospital: Hospital) -> [Doctor] {
        doctors.filter { HospitalData.matches($0.hospital, hospital.name) }
    }

    private static func standardized(_ doctor: Doctor) -> Doctor {
        let cleanedLanguages = Array(
            NSOrderedSet(array: doctor.languages.map(cleaned).filter { !$0.isEmpty })
        ) as? [String] ?? []

        return Doctor(
            name: cleaned(doctor.name),
            specialty: cleaned(doctor.specialty),
            hospital: HospitalData.canonicalHospitalName(for: doctor.hospital),
            intro: cleaned(doctor.intro),
            rating: min(max(doctor.rating, 0), 5),
            imageName: cleaned(doctor.imageName).isEmpty ? "person.crop.circle.fill" : cleaned(doctor.imageName),
            education: cleaned(doctor.education).isEmpty ? "Medical Degree" : cleaned(doctor.education),
            languages: cleanedLanguages.isEmpty ? ["Arabic", "English"] : cleanedLanguages,
            experience: max(doctor.experience, 0),
            patientsServed: max(doctor.patientsServed, 0)
        )
    }

    private static func cleaned(_ text: String) -> String {
        text
            .replacingOccurrences(of: "\t", with: " ")
            .split(separator: " ")
            .joined(separator: " ")
            .trimmingCharacters(in: .whitespacesAndNewlines)
    }
}
