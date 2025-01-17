//
//  HomePageView.swift
//  planner
//
//  Created by Kelvin Nguyen on 1/17/25.
//


import SwiftUI

struct HomePageView: View {
    let userName: String

    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.green.opacity(0.4), Color.cyan.opacity(0.8)]),
                           startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                Text("Hello, \(userName)!")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.white)
                
                Text("Welcome to your homepage.")
                    .font(.body)
                    .foregroundColor(.white.opacity(0.8))
                
                // Example Content
                VStack(spacing: 10) {
                    Text("Your personalized dashboard:")
                        .font(.headline)
                        .foregroundColor(.white)
                    
                    Text("• Recent Activities")
                        .foregroundColor(.white.opacity(0.8))
                    Text("• Upcoming Events")
                        .foregroundColor(.white.opacity(0.8))
                    Text("• Messages")
                        .foregroundColor(.white.opacity(0.8))
                }
                
                Spacer()
            }
            .padding()
        }
    }
}
