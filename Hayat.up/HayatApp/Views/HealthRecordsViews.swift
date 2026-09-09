import SwiftUI

// MARK: - Allergies
struct AllergiesView: View {
    @EnvironmentObject var appState: AppState
    @State private var showingAddAllergy = false
    
    var body: some View {
        ZStack {
            HayatBackground()
            Group {
                if appState.allergies.isEmpty {
                    VStack(spacing: 16) {
                        Image(systemName: "exclamationmark.triangle.fill")
                            .font(.system(size: 60))
                            .foregroundColor(.gray)
                        Text(appState.localized("No Allergies"))
                            .font(.title2)
                            .fontWeight(.bold)
                        Text(appState.localized("Add any allergies you have for your safety."))
                            .foregroundColor(.secondary)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                    }
                } else {
                    ScrollView {
                        LazyVStack(spacing: 16) {
                            ForEach(appState.allergies) { allergy in
                                NavigationLink(destination: AllergyDetailView(allergy: allergy)) {
                                    AllergyCard(allergy: allergy)
                                }
                                .buttonStyle(PlainButtonStyle())
                            }
                        }
                        .padding()
                    }
                }
            }
        }
        .navigationTitle(appState.localized("Allergies"))
        .toolbar {
            Button {
                showingAddAllergy = true
            } label: {
                Image(systemName: "plus")
            }
        }
        .sheet(isPresented: $showingAddAllergy) {
            AddAllergySheet()
        }
    }
}

struct AllergyDetailView: View {
    let allergy: Allergy
    @EnvironmentObject var appState: AppState
    @Environment(\.dismiss) var dismiss
    @State private var showingDeleteAlert = false
    
    var severityColor: Color {
        switch allergy.severity {
        case "Mild": return .green
        case "Moderate": return .orange
        case "Severe": return .red
        default: return .gray
        }
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                // Header
                VStack(spacing: 16) {
                    Image(systemName: "exclamationmark.triangle.fill")
                        .font(.system(size: 60))
                        .foregroundColor(severityColor)
                        .padding()
                        .background(severityColor.opacity(0.1))
                        .clipShape(Circle())
                    
                    Text(allergy.allergen)
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Text(appState.localized(allergy.severity))
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 6)
                        .background(severityColor)
                        .cornerRadius(20)
                }
                .padding(.top, 20)
                
                // Details Card
                VStack(alignment: .leading, spacing: 16) {
                    DetailRow(label: appState.localized("Reaction"), value: allergy.reaction)
                    if !allergy.notes.isEmpty {
                        Divider()
                        VStack(alignment: .leading, spacing: 8) {
                            Text(appState.localized("Notes"))
                                .foregroundColor(.secondary)
                            Text(allergy.notes)
                                .fontWeight(.medium)
                        }
                    }
                }
                .padding()
                .background(Color(uiColor: .secondarySystemGroupedBackground))
                .cornerRadius(16)
                .padding(.horizontal)
                
                Spacer()
                
                Button(role: .destructive) {
                    showingDeleteAlert = true
                } label: {
                    HStack {
                        Image(systemName: "trash")
                        Text(appState.localized("Delete Allergy"))
                    }
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.red)
                    .cornerRadius(16)
                }
                .padding()
            }
        }
        .navigationTitle(appState.localized("Allergy Details"))
        .background(HayatBackground())
        .alert(appState.localized("Delete Allergy?"), isPresented: $showingDeleteAlert) {
            Button(appState.localized("Delete"), role: .destructive) {
                deleteAllergy()
            }
            Button(appState.localized("Cancel"), role: .cancel) { }
        } message: {
            Text(appState.localized("Are you sure you want to delete this allergy?"))
        }
    }
    
    private func deleteAllergy() {
        if let index = appState.allergies.firstIndex(where: { $0.id == allergy.id }) {
            appState.allergies.remove(at: index)
            
            // Force persistence
            if let encoded = try? JSONEncoder().encode(appState.allergies) {
                UserDefaults.standard.set(encoded, forKey: "allergies")
                UserDefaults.standard.synchronize()
            }
            
            dismiss()
        }
    }
}

struct AddAllergySheet: View {
    @EnvironmentObject var appState: AppState
    @Environment(\.dismiss) var dismiss
    
    @State private var allergyName = ""
    @State private var reaction = ""
    @State private var notes = ""
    @State private var sensitivity: Double = 1.0 // 0: Mild, 1: Moderate, 2: Severe
    
    var sensitivityString: String {
        if sensitivity < 0.6 { return "Mild" }
        if sensitivity < 1.6 { return "Moderate" }
        return "Severe"
    }
    
    var sensitivityColor: Color {
        if sensitivity < 0.6 { return .green }
        if sensitivity < 1.6 { return .orange }
        return .red
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text(appState.localized("Allergy Details"))) {
                    TextField(appState.localized("Allergy Name (e.g., Dust)"), text: $allergyName)
                    TextField(appState.localized("Reaction (e.g., Rash)"), text: $reaction)
                }
                
                Section(header: Text(appState.localized("Sensitivity"))) {
                    VStack {
                        HStack {
                            Text(appState.localized(sensitivityString))
                                .fontWeight(.bold)
                                .foregroundColor(sensitivityColor)
                            Spacer()
                        }
                        Slider(value: $sensitivity, in: 0...2, step: 1)
                            .accentColor(sensitivityColor)
                        HStack {
                            Text(appState.localized("Mild")).font(.caption)
                            Spacer()
                            Text(appState.localized("Moderate")).font(.caption)
                            Spacer()
                            Text(appState.localized("Severe")).font(.caption)
                        }
                    }
                }
                
                Section(header: Text(appState.localized("Notes (Optional)"))) {
                    TextField(appState.localized("Additional Notes"), text: $notes)
                }
            }
            .navigationTitle(appState.localized("Add Allergy"))
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button(appState.localized("Cancel")) { dismiss() }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button(appState.localized("Save")) {
                        saveAllergy()
                    }
                    .disabled(allergyName.isEmpty || reaction.isEmpty)
                }
            }
        }
    }
    
    private func saveAllergy() {
        let newAllergy = Allergy(
            allergen: allergyName,
            severity: sensitivityString,
            reaction: reaction,
            notes: notes
        )
        appState.allergies.append(newAllergy)
        dismiss()
    }
}

struct AllergyCard: View {
    @EnvironmentObject var appState: AppState
    let allergy: Allergy
    
    var severityColor: Color {
        switch allergy.severity {
        case "Mild": return .green
        case "Moderate": return .orange
        case "Severe": return .red
        default: return .gray
        }
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Image(systemName: "exclamationmark.triangle.fill")
                    .foregroundColor(severityColor)
                    .font(.title2)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(allergy.allergen)
                        .font(.headline)
                        .foregroundColor(.primary)
                    Text("\(appState.localized("Reaction")): \(allergy.reaction)")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                Spacer()
                Text(appState.localized(allergy.severity))
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(severityColor)
                    .cornerRadius(8)
            }
            
            if !allergy.notes.isEmpty {
                Divider()
                Text(allergy.notes)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
        }
        .padding()
        .background(Color(uiColor: .secondarySystemGroupedBackground))
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 2)
    }
}
