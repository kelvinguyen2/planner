//  CreateItineraryView.swift
//  planner
//
//  Created by Kelvin Nguyen on 1/17/25.

import SwiftUI

struct CreateItineraryView: View {
    @Environment(\.presentationMode) var presentationMode // To dismiss the view
    @Binding var trips: [Itinerary] // Binding to update the trips on the homepage

    @State private var tripName: String = ""
    @State private var destination: String = ""
    @State private var startDate = Date()
    @State private var endDate = Date()
    @State private var packingList: [String] = []
    @State private var toDoList: [String] = []
    @State private var expenses: [(description: String, amount: Double)] = []
    @State private var selectedTab: Int = 0

    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section(header: Text("Trip Details")) {
                        TextField("Trip Name", text: $tripName)
                            .padding()
                            .background(Color.white.opacity(0.2))
                            .cornerRadius(10)
                        TextField("Destination", text: $destination)
                            .padding()
                            .background(Color.white.opacity(0.2))
                            .cornerRadius(10)

                        HStack {
                            DatePicker("Start Date", selection: $startDate, displayedComponents: .date)
                            DatePicker("End Date", selection: $endDate, displayedComponents: .date)
                        }
                    }

                    Section(header: Text("Pack and Plan")) {
                        Picker("Options", selection: $selectedTab) {
                            Text("Packing List").tag(0)
                            Text("To-Do List").tag(1)
                            Text("Expenses Tracker").tag(2)
                        }
                        .pickerStyle(SegmentedPickerStyle())
                        .padding()

                        if selectedTab == 0 {
                            PackingListView(packingList: $packingList)
                        } else if selectedTab == 1 {
                            ToDoListView(toDoList: $toDoList)
                        } else if selectedTab == 2 {
                            ExpenseTrackerView(expenses: $expenses)
                        }
                    }
                }
                .navigationTitle("Create Itinerary")
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarItems(trailing: Button("Done") {
                    saveItinerary()
                })
            }
        }
    }

    private func saveItinerary() {
        let newItinerary = Itinerary(
            tripName: tripName,
            destination: destination,
            startDate: startDate,
            endDate: endDate,
            packingList: packingList,
            toDoList: toDoList,
            expenses: expenses
        )
        trips.append(newItinerary) // Add the new trip to the list
        presentationMode.wrappedValue.dismiss() // Dismiss the view
    }
}

struct PackingListView: View {
    @Binding var packingList: [String]
    @State private var newItem: String = ""

    var body: some View {
        VStack {
            TextField("Add Item", text: $newItem, onCommit: {
                if !newItem.isEmpty {
                    packingList.append(newItem)
                    newItem = ""
                }
            })
            .padding()
            .background(Color.white.opacity(0.2))
            .cornerRadius(10)
            .padding(.horizontal)

            List {
                ForEach(packingList, id: \ .self) { item in
                    Text(item)
                }
                .onDelete { indices in
                    packingList.remove(atOffsets: indices)
                }
            }
        }
    }
}

struct ToDoListView: View {
    @Binding var toDoList: [String]
    @State private var newTask: String = ""

    var body: some View {
        VStack {
            TextField("Add Task", text: $newTask, onCommit: {
                if !newTask.isEmpty {
                    toDoList.append(newTask)
                    newTask = ""
                }
            })
            .padding()
            .background(Color.white.opacity(0.2))
            .cornerRadius(10)
            .padding(.horizontal)

            List {
                ForEach(toDoList, id: \ .self) { task in
                    Text(task)
                }
                .onDelete { indices in
                    toDoList.remove(atOffsets: indices)
                }
            }
        }
    }
}

struct ExpenseTrackerView: View {
    @Binding var expenses: [(description: String, amount: Double)]
    @State private var newDescription: String = ""
    @State private var newAmount: String = ""

    var body: some View {
        VStack {
            HStack {
                TextField("Description", text: $newDescription)
                    .padding()
                    .background(Color.white.opacity(0.2))
                    .cornerRadius(10)

                TextField("Amount", text: $newAmount)
                    .keyboardType(.decimalPad)
                    .padding()
                    .background(Color.white.opacity(0.2))
                    .cornerRadius(10)
            }
            .padding(.horizontal)

            Button("Add Expense") {
                if let amount = Double(newAmount), !newDescription.isEmpty {
                    expenses.append((newDescription, amount))
                    newDescription = ""
                    newAmount = ""
                }
            }
            .buttonStyle(PrimaryButtonStyle())

            List {
                ForEach(expenses, id: \ .description) { expense in
                    HStack {
                        Text(expense.description)
                        Spacer()
                        Text("$\(expense.amount, specifier: "%.2f")")
                    }
                }
                .onDelete { indices in
                    expenses.remove(atOffsets: indices)
                }
            }
        }
    }
}

struct Itinerary: Identifiable { // Itinerary model
    let id = UUID()
    let tripName: String
    let destination: String
    let startDate: Date
    let endDate: Date
    let packingList: [String]
    let toDoList: [String]
    let expenses: [(description: String, amount: Double)]
}

