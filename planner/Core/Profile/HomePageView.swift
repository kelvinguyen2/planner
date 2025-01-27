//  HomePageView.swift
//  planner
//
//  Created by Kelvin Nguyen on 1/17/25.

import SwiftUI

struct HomePageView: View {
    let userName: String
    @State private var isCreateItineraryPresented = false // State to control Create Itinerary view presentation
    @State private var trips: [Itinerary] = [] // List of trips
    @State private var selectedItinerary: Itinerary? // Selected itinerary for viewing

    var body: some View {
        NavigationView {
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

                    // List of Trips
                    if trips.isEmpty {
                        Text("No trips created yet. Start by creating your first itinerary!")
                            .font(.body)
                            .foregroundColor(.white.opacity(0.8))
                            .multilineTextAlignment(.center)
                            .padding()
                    } else {
                        List {
                            ForEach(trips) { trip in
                                Button(action: {
                                    selectedItinerary = trip
                                }) {
                                    VStack(alignment: .leading) {
                                        Text(trip.tripName)
                                            .font(.headline)
                                            .foregroundColor(.black)
                                        Text("Destination: \(trip.destination)")
                                            .font(.subheadline)
                                            .foregroundColor(.gray)
                                        Text("Dates: \(formatDate(trip.startDate)) - \(formatDate(trip.endDate))")
                                            .font(.caption)
                                            .foregroundColor(.gray)
                                    }
                                    .padding()
                                }
                                .background(Color.white.opacity(0.9))
                                .cornerRadius(10)
                            }
                        }
                        .listStyle(InsetGroupedListStyle())
                        .background(Color.white.opacity(0.1))
                    }

                    Spacer()

                    // Button to Create Itinerary
                    Button(action: {
                        isCreateItineraryPresented.toggle()
                    }) {
                        Text("Create Itinerary")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(25)
                    }
                    .padding(.horizontal, 40)
                    .sheet(isPresented: $isCreateItineraryPresented) {
                        CreateItineraryView(trips: $trips) // Pass trips binding to the Create Itinerary view
                    }
                }
                .padding()
            }
            .navigationTitle("Home")
            .navigationBarTitleDisplayMode(.inline)
            .background(
                NavigationLink(
                    destination: destinationView(),
                    isActive: Binding(
                        get: { selectedItinerary != nil },
                        set: { if !$0 { selectedItinerary = nil } }
                    )
                ) {
                    EmptyView()
                }
            )
        }
    }

    private func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: date)
    }

    private func destinationView() -> some View {
        if let itinerary = selectedItinerary {
            return AnyView(ItineraryView(itinerary: itinerary))
        } else {
            return AnyView(EmptyView())
        }
    }
}

