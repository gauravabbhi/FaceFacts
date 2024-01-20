//
//  ContentView.swift
//  FaceFacts
//
//  Created by Karan on 16/01/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @State private var path = [Person]()
    @Query var people: [Person]
    
    var body: some View {
        NavigationStack(path: $path){
            List {
                ForEach(people) { person in
                    NavigationLink(value: person){
                        Text(person.name)
                    }
                }
            }
            .navigationTitle("Face Facts")
            .navigationDestination(for: Person.self) { person in
                                EditPersonView(person: person)
                            }
            .toolbar {
                Button("Add Person", systemImage: "plus", action: addPerson)
            }
        }
    }
    
    func addPerson() {
        let person = Person(name: "", emailAddress: "", details: "")
        modelContext.insert(person)
        path.append(person)
    }
}

#Preview {
    
    do {
        let configuration = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Person.self, configurations: configuration)
        let context = container.mainContext
       
        let personsData = [
                ("Karan", "karan@gmail.com", "some details"),
                ("Gaurav", "gaurav@gmail.com", "some details"),
                ("Rishab", "rishab@gmail.com", "some details")
            ]
            
            var persons: [Person] = []

            for data in personsData {
                let person = Person(name: data.0, emailAddress: data.1, details: data.2)
                context.insert(person)
                persons.append(person)
            }
        
        
        return ContentView()
            .modelContainer(container)
    } catch {
        fatalError("Something went wrong")
    }
    
}
