//
//  ContentView.swift
//  planner
//
//  Created by Kelvin Nguyen on 1/17/25.
//

import SwiftUI
import UIKit
import FirebaseCore

class AppDelegate: UIResponder, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        return true
    }
}


struct ContentView: View {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    init() {
            // Initialize Firebase
            FirebaseApp.configure()
        }
    var body: some View {
            LoginSignupView()
    }
}

#Preview {
    ContentView()
}
