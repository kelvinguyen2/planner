//  SignupView.swift
//  planner
//
//  Created by Kelvin Nguyen on 1/17/25.

import SwiftUI
import FirebaseAuth

struct SignupView: View {
    @State private var fullName = "" // Full Name field
    @State private var email = "" // Email field
    @State private var password = "" // Password field
    @State private var isPrivacyChecked = false // Checkbox for Terms and Privacy Policy
    @State private var hasReviewedTerms = false // Trigger for reviewed Terms
    @State private var navigateToVerification = false // Navigation to verification
    @State private var errorMessage: String? // Error message for validation
    @State private var isLoading = false // Loading state

    var body: some View {
        ZStack {
            // Background Gradient
            LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.4), Color.cyan.opacity(0.7)]),
                           startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()

            VStack(spacing: 30) {
                Spacer()

                // Title
                Text("Sign Up")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.white)

                // Description
                Text("Enter your details and agree to our terms to create your account.")
                    .font(.body)
                    .foregroundColor(.white.opacity(0.8))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 40)

                // Full Name Input Field
                VStack(alignment: .leading, spacing: 8) {
                    Text("Full Name")
                        .font(.caption)
                        .foregroundColor(.white.opacity(0.8))

                    TextField("Enter your full name", text: $fullName)
                        .autocapitalization(.words)
                        .padding()
                        .background(Color.white.opacity(0.2))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                }
                .padding(.horizontal, 40)

                // Email Input Field
                VStack(alignment: .leading, spacing: 8) {
                    Text("Email Address")
                        .font(.caption)
                        .foregroundColor(.white.opacity(0.8))

                    TextField("Enter your email", text: $email)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                        .padding()
                        .background(Color.white.opacity(0.2))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                }
                .padding(.horizontal, 40)

                // Password Input Field
                VStack(alignment: .leading, spacing: 8) {
                    Text("Password")
                        .font(.caption)
                        .foregroundColor(.white.opacity(0.8))

                    SecureField("Enter your password", text: $password)
                        .padding()
                        .background(Color.white.opacity(0.2))
                        .cornerRadius(10)
                        .foregroundColor(.white)

                    if let errorMessage = errorMessage {
                        Text(errorMessage)
                            .font(.caption)
                            .foregroundColor(.red)
                            .padding(.leading, 10)
                    }
                }
                .padding(.horizontal, 40)

                // Privacy Checkbox and Agreement Link
                HStack {
                    Button(action: {
                        isPrivacyChecked.toggle()
                    }) {
                        Image(systemName: isPrivacyChecked ? "checkmark.circle.fill" : "circle")
                            .foregroundColor(isPrivacyChecked ? Color.blue : Color.white)
                            .font(.title2)
                    }.disabled(!hasReviewedTerms)

                    NavigationLink(destination: AgreementPageView(hasReviewedTerms: $hasReviewedTerms)) {
                        Text("By signing up, you agree to the Terms and Privacy Policy.")
                            .underline()
                            .font(.caption)
                            .foregroundColor(.white.opacity(0.8))
                    }
                }
                .padding(.horizontal, 40)

                // Sign-Up Button
                Button(action: signUp) {
                    if isLoading {
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle(tint: .white))
                            .padding()
                    } else {
                        Text("Sign Up")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(isPrivacyChecked && hasReviewedTerms && validateInputs()
                                            ? Color.blue
                                            : Color.gray)
                            .foregroundColor(.white)
                            .cornerRadius(25)
                            .shadow(radius: 5)
                    }
                }
                .padding(.horizontal, 40)
                .disabled(!isPrivacyChecked || !hasReviewedTerms || !validateInputs() || isLoading)

                Spacer()
            }
        }
    }

    // Validation Function
    func validateInputs() -> Bool {
        if fullName.trimmingCharacters(in: .whitespaces).isEmpty {
            errorMessage = "Please enter your full name."
            return false
        }
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        if !emailPredicate.evaluate(with: email) {
            errorMessage = "Please enter a valid email address."
            return false
        }
        if password.count < 6 {
            errorMessage = "Password must be at least 6 characters long."
            return false
        }
        errorMessage = nil
        return true
    }

    // Firebase Sign-Up Function with Email Verification
    func signUp() {
        guard validateInputs() else { return }
        isLoading = true
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            isLoading = false
            if let error = error {
                errorMessage = error.localizedDescription
                return
            }

            // Send Email Verification
            result?.user.sendEmailVerification { error in
                if let error = error {
                    errorMessage = error.localizedDescription
                    return
                }

                // Notify user to verify email before proceeding
                errorMessage = "A verification email has been sent to \(email). Please verify your email before logging in."
            }
        }
    }
}

