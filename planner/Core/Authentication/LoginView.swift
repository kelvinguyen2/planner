//
//  LoginView 2.swift
//  planner
//
//  Created by Kelvin Nguyen on 1/17/25.
//


import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var isPasswordVisible = false
    @State private var isAuthenticated = false
    @State private var userName: String = "" // Store the logged-in user's name
    
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
                    
                    CustomTextField(placeholder:"Email", text: $email, icon: "envelope.fill")
                    CustomSecureField(placeholder:"Password", text: $password, isVisible: $isPasswordVisible)
                    
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
                    
                    // Navigate to HomePageView when authenticated
                    NavigationLink(destination: HomePageView(userName: userName), isActive: $isAuthenticated) {
                        EmptyView()
                    }
                    
                    Spacer()
                }
            }
        }
    }
    
    func authenticateUser() {
        // Simulate authentication logic
        if email == "user@example.com" && password == "password123" {
            userName = "John Doe" // Replace with dynamic data from your backend
            isAuthenticated = true
        } else {
            // Handle invalid login
            print("Invalid credentials")
        }
    }
}
