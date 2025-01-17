//
//  PrimaryButtonStyle.swift
//  planner
//
//  Created by Kelvin Nguyen on 1/17/25.
//


import SwiftUI

struct PrimaryButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(25)
            .shadow(radius: 5)
    }
}
