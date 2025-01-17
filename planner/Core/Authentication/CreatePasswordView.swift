//
//  CreatePasswordView.swift
//  planner
//
//  Created by Kelvin Nguyen on 1/17/25.
//

import SwiftUI
struct CreatePasswordView: View {
    let email: String
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var navigateToCompleteSignUp = false
    @State private var errorMessage: String?
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.4), Color.white]),
                           startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            VStack(spacing: 30) {
                Spacer()
                Text("Create Password")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.white)
                Text("Choose a secure password to protect your account.")
                    .font(.body)
                    .foregroundColor(.white.opacity(0.8))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 40)
                VStack(spacing: 15) {
                    SecureField("Enter your password", text: $password)
                        .padding()
                        .background(Color.white.opacity(0.2))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                    SecureField("Confirm your password", text: $confirmPassword)
                        .padding()
                        .background(Color.white.opacity(0.2))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                }
                .padding(.horizontal, 40)
                if let errorMessage = errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                        .font(.caption)
                        .padding(.horizontal, 40)
                }
                Button(action: validateAndProceed) {
                    Text("Continue")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(25)
                }
                .padding(.horizontal, 40)
                NavigationLink(destination: CompleteSignUpView(email: email),
                               isActive: $navigateToCompleteSignUp,
                               label: { EmptyView() })
                Spacer()
            }
        }
    }
    func validateAndProceed() {
        if password.count < 12 {
            errorMessage = "Password must be at least 12 characters."
        } else if password != confirmPassword {
            errorMessage = "Passwords do not match."
        } else {
            navigateToCompleteSignUp = true
        }
    }
}
