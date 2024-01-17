//
//  FaceFactsApp.swift
//  FaceFacts
//
//  Created by Karan on 16/01/24.
//

import SwiftUI
import SwiftData

@main
struct FaceFactsApp: App {
    
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Person.self)
    }
}
