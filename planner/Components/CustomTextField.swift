//
//  CustomTextField.swift
//  planner
//
//  Created by Kelvin Nguyen on 1/17/25.
//


import SwiftUI

struct CustomTextField: View {
    let placeholder: String
    @Binding var text: String
    let icon: String
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(.white.opacity(0.8))
            TextField(placeholder, text: $text)
                .foregroundColor(.white)
                .padding()
        }
        .background(Color.white.opacity(0.2))
        .cornerRadius(10)
        .padding(.horizontal, 40)
    }
}
