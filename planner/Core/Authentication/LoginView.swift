//
//  LoginView 2.swift
//  planner
//
//  Created by Kelvin Nguyen on 1/17/25.
//


import SwiftUI
import FirebaseAuth

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var isPasswordVisible = false
    @State private var isAuthenticated = false
    @State private var errorMessage: String?
    @State private var userName: String = "" // User's name from Firebase
    
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.5), Color.cyan.opacity(0.8)]),
                               startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                
                VStack(spacing: 30) {
                    Spacer()
                    
                    Text("Log In")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.white)
                    
                    // Email and Password Inputs
                    CustomTextField(placeholder:"Email", text: $email, icon: "envelope.fill")
                    CustomSecureField(placeholder: "Password", text: $password, isVisible: $isPasswordVisible)
                    
                    // Error Message
                    if let errorMessage = errorMessage {
                        Text(errorMessage)
                            .foregroundColor(.red)
                            .font(.caption)
                            .padding(.top, -10)
                    }
                    
                    // Login Button
                    Button(action: {
                        authenticateUser()
                    }) {
                        Text("Log In")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(25)
                    }
                    .padding(.horizontal, 40)
                    
                    // Navigation to HomePageView if authenticated
                    NavigationLink(destination: HomePageView(userName: userName), isActive: $isAuthenticated) {
                        EmptyView()
                    }
                    
                    Spacer()
                }
            }
        }
    }
    
    func authenticateUser() {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                self.errorMessage = error.localizedDescription
                return
            }
            
            // Get user data
            if let user = result?.user {
                self.userName = user.displayName ?? "User"
                self.isAuthenticated = true
            } else {
                self.errorMessage = "Unable to retrieve user data."
            }
        }
    }
}
