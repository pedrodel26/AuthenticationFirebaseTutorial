//
//  AuthenticationTutorialApp.swift
//  AuthenticationTutorial
//
//  Created by Pedro Delmondes  on 31/07/2024.
//

import SwiftUI
import Firebase

@main
struct AuthenticationTutorialApp: App {
    @StateObject var viewModel = AuthViewModel()
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
        }
    }
}
