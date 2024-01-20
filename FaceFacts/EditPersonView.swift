//
//  EditPersonView.swift
//  FaceFacts
//
//  Created by Karan on 16/01/24.
//

import SwiftUI
import SwiftData

struct EditPersonView: View {
    @Bindable var person: Person
    
    var body: some View {
        Form {
            Section {
                TextField("Name", text: $person.name)
                    .textContentType(.name)
                
                TextField("Email address", text: $person.emailAddress)
                    .textContentType(.emailAddress)
                    .textInputAutocapitalization(.never)
            }
            
            Section("Notes"){
                TextField("Details about this person", text: $person.details, axis: .vertical)
            }
        }
        .navigationTitle("Edit Person")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Person.self, configurations: config)
        var person = Person(name: "Karan", emailAddress: "karan@gmail.com", details: "some details")
        return EditPersonView(person: person)
            .modelContainer(container)

    } catch {
        fatalError("Failed to create model container")
    }
}
