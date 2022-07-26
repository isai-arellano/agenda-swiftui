//
//  AgendaApp.swift
//  Agenda
//
//  Created by Isaí on 24/07/22.
//

import SwiftUI
import Firebase


@main
struct AgendaApp: App {
    @StateObject var firestoreManager = FirestoreManager()
    
    
    init(){
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            LoginView()
                .environmentObject(firestoreManager)
        }
    }
}
