//
//  ItineraryView.swift
//  planner
//
//  Created by Kelvin Nguyen on 1/26/25.
//


//  ItineraryView.swift
//  planner
//
//  Created by Kelvin Nguyen on 1/17/25.

import SwiftUI

struct ItineraryView: View {
    let itinerary: Itinerary // The itinerary to display

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                // Trip Name and Destination
                VStack(alignment: .leading, spacing: 10) {
                    Text(itinerary.tripName)
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.blue)

                    Text("Destination: \(itinerary.destination)")
                        .font(.headline)
                        .foregroundColor(.gray)

                    Text("Dates: \(formatDate(itinerary.startDate)) - \(formatDate(itinerary.endDate))")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                .padding()
                .background(Color.white.opacity(0.9))
                .cornerRadius(10)

                // Packing List
                VStack(alignment: .leading, spacing: 10) {
                    Text("Packing List")
                        .font(.title2)
                        .bold()

                    if itinerary.packingList.isEmpty {
                        Text("No items in the packing list.")
                            .foregroundColor(.gray)
                    } else {
                        ForEach(itinerary.packingList, id: \ .self) { item in
                            Text("• \(item)")
                        }
                    }
                }
                .padding()
                .background(Color.white.opacity(0.9))
                .cornerRadius(10)

                // To-Do List
                VStack(alignment: .leading, spacing: 10) {
                    Text("To-Do List")
                        .font(.title2)
                        .bold()

                    if itinerary.toDoList.isEmpty {
                        Text("No tasks in the to-do list.")
                            .foregroundColor(.gray)
                    } else {
                        ForEach(itinerary.toDoList, id: \ .self) { task in
                            Text("• \(task)")
                        }
                    }
                }
                .padding()
                .background(Color.white.opacity(0.9))
                .cornerRadius(10)

                // Expenses Tracker
                VStack(alignment: .leading, spacing: 10) {
                    Text("Expenses Tracker")
                        .font(.title2)
                        .bold()

                    if itinerary.expenses.isEmpty {
                        Text("No expenses recorded.")
                            .foregroundColor(.gray)
                    } else {
                        ForEach(itinerary.expenses, id: \ .description) { expense in
                            HStack {
                                Text(expense.description)
                                Spacer()
                                Text("$\(expense.amount, specifier: "%.2f")")
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                }
                .padding()
                .background(Color.white.opacity(0.9))
                .cornerRadius(10)

                Spacer()
            }
            .padding()
        }
        .navigationTitle("Itinerary Details")
        .navigationBarTitleDisplayMode(.inline)
        .background(LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.3), Color.cyan.opacity(0.3)]), startPoint: .top, endPoint: .bottom).ignoresSafeArea())
    }

    private func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: date)
    }
}

struct ItineraryView_Previews: PreviewProvider {
    static var previews: some View {
        ItineraryView(itinerary: Itinerary(
            tripName: "Trip to Hawaii",
            destination: "Hawaii",
            startDate: Date(),
            endDate: Date().addingTimeInterval(86400 * 7),
            packingList: ["Sunglasses", "Sunscreen", "Swimwear"],
            toDoList: ["Book flights", "Reserve hotel", "Pack bags"],
            expenses: [(description: "Flight tickets", amount: 500.0), (description: "Hotel", amount: 1200.0)]
        ))
    }
}
