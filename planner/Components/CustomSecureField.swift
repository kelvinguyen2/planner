//
//  CustomSecureField.swift
//  planner
//
//  Created by Kelvin Nguyen on 1/17/25.
//


import SwiftUI

struct CustomSecureField: View {
    let placeholder: String
    @Binding var text: String
    @Binding var isVisible: Bool // Toggle for password visibility
    
    var body: some View {
        HStack {
            // SecureField or TextField depending on visibility state
            if isVisible {
                TextField(placeholder, text: $text)
                    .textContentType(.password)
                    .autocapitalization(.none)
                    .foregroundColor(.white)
                    .padding()
            } else {
                SecureField(placeholder, text: $text)
                    .textContentType(.password)
                    .autocapitalization(.none)
                    .foregroundColor(.white)
                    .padding()
            }
            
            // Visibility Toggle Button
            Button(action: {
                isVisible.toggle()
            }) {
                Image(systemName: isVisible ? "eye.slash.fill" : "eye.fill")
                    .foregroundColor(.white.opacity(0.8))
            }
        }
        .background(Color.white.opacity(0.2))
        .cornerRadius(10)
        .padding(.horizontal, 40)
    }
}
