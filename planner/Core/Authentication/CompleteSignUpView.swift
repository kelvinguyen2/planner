//
//  CompleteSignUpView.swift
//  planner
//
//  Created by Kelvin Nguyen on 1/17/25.
//

import SwiftUI

struct CompleteSignUpView: View {
    let email: String
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.4), Color.white]),
                           startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack(spacing: 30) {
                Spacer()
                
                // Title
                Text("Complete Sign-Up")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.white)
                
                // Confirmation Message
                Text("""
A confirmation email has been sent to \(email).
Please check your inbox and click the link to verify your account.
""")
                    .font(.body)
                    .foregroundColor(.white.opacity(0.8))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 40)
                
                // Continue Button to go back to LoginView
                NavigationLink(destination: LoginView()) {
                    Text("Continue to Login")
                        .font(.body)
                        .fontWeight(.bold)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(25)
                }
                .padding(.horizontal, 40)
                
                Spacer()
            }
        }
    }
}
