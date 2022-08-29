//
//  swift_firebase_socialApp.swift
//  swift-firebase-social
//
//  Created by Connor Hutchinson on 8/29/22.
//

import SwiftUI
import Firebase

@main
struct swift_firebase_socialApp: App {
    @StateObject var viewModel = UserAuthViewModel()
        
    @AppStorage("isDarkMode") private var isDarkMode = false
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            
            ContentView()
                .preferredColorScheme(isDarkMode ? .dark : .light)
                .environmentObject(viewModel)
            
            
        }
    }
}
