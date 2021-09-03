//
//  BillSplitView.swift
//  BillSplitView
//
//  Created by global on 22/08/21.
//

import SwiftUI

struct BillSplitView: View {
    @State private var checkAmount = ""
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 2

    let tipPercentages = [10, 15, 20, 25, 0]

    var amountPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let amountPerPerson = totalAmount / peopleCount
        return amountPerPerson
    }

    var totalAmount: Double {
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0

        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal = orderAmount + tipValue
        return grandTotal
    }

    var amountTextField: some View {
        TextField("Amount", text: $checkAmount)
    }

    var body: some View {
        // WelcomeNavigationFormView()
        NavigationView {
            Form {
                Section {
                    amountTextField
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2 ..< 100) {
                            Text("\($0) people")
                        }
                    }
                }
                Section(header: Text("How much tip do you want to leave?")) {
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(0 ..< tipPercentages.count) {
                            Text("\(self.tipPercentages[$0])%")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                // .modifier(SectionHeaderStyle())
                Section(header: Text("Amount per person")) {
                    Text("$\(amountPerPerson, specifier: "%.2f")")
                        .largeBlueStyle()
                }
                Section(header: Text("Total amount")) {
                    Text("$\(totalAmount, specifier: "%.2f")")
                }
            }
            .navigationBarTitle(Text("HotelBillSplit"))
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }

    private struct SectionHeaderStyle: ViewModifier {
        func body(content: Content) -> some View {
            Group {
                if #available(iOS 14, *) {
                    AnyView(content.textCase(.none))
                } else {
                    content
                }
            }
        }
    }
}

private struct LargeBlueStyle: ViewModifier {
    func body(content: Content) -> some View {
        content.font(.largeTitle).foregroundColor(.blue)
    }
}

private extension View {
    func largeBlueStyle() -> some View {
        self.modifier(LargeBlueStyle())
    }
}
