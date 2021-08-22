//
//  ContentView.swift
//  HotelBill
//
//  Created by global on 21/08/21.
//

import SwiftUI
import Introspect

struct ContentView: View {
    private let title = "SwiftUI"

    var body: some View {
        NavigationView {
            // This modifier got deprecated for iOS 13 to 15
            // From iOS 14 itself we can use the modifiers:
            // .navigationTitle("").navigationBarTitleDisplayMode(.automatic)
            if #available(iOS 14.0, *) {
                WelcomeFormView().navigationTitle(title).navigationBarTitleDisplayMode(.automatic)
            } else {
                WelcomeFormView()
                    .navigationBarTitle(Text(title), displayMode: .automatic)
            }
        }.navigationViewStyle(StackNavigationViewStyle())
    }

    // Picker view with some items
    private struct GenderPickerView: View {
        @State private var selection = 0

        let items = ["Male", "Female", "Other"]

        var body: some View {
            Text("Gender: \(items[selection])")
            Picker("Select gender", selection: $selection) {
                ForEach(0 ..< items.count) {
                    Text("\(items[$0])")
                }
            }
            // MenuPickerStyle, InlinePickerStyle is available from iOS 14.0
            .pickerStyle(SegmentedPickerStyle())
        }
    }

    private struct DatePickerView: View {
        @State private var birthDate = Date()
        @State private var showsDatePicker = false

        let title = "Birthdate"
        let formatter: DateFormatter = {
            let formatter = DateFormatter()
            formatter.dateStyle = .long
            return formatter
        }()

        var body: some View {
            HStack {
                Text(title)
                Spacer()
                Button("\(birthDate, formatter: formatter)") {
                    self.showsDatePicker.toggle()
                }
                .padding(5)
                .foregroundColor(.red)
                .background(Color.yellow)
                .clipShape(Capsule())
            }
            if showsDatePicker {
                if #available(iOS 14.0, *) {
                    DatePicker(title, selection: $birthDate, in: ...Date(), displayedComponents: .date)
                        .datePickerStyle(GraphicalDatePickerStyle())
                } else {
                    DatePicker(title, selection: $birthDate, in: ...Date(), displayedComponents: .date)
                        .datePickerStyle(WheelDatePickerStyle())
                }
            }
        }
    }

    // Welcome form view which allows to welcome a user
    private struct WelcomeFormView: View {
        @State private var name = ""
        // @FocusState private var nameIsFocused: Bool

        var body: some View {
            Form {
                Group {
                    Section {
                        Text("Hello \(name)!")
                                    .padding()
                                    .foregroundColor(.red)
                                    .border(.green, width: 2)
                                    .font(.headline)
                                    .onTapGesture {
                                        // self.nameIsFocused.toggle()
                                    }
                        if #available(iOS 15.0, *) {
                            TextField("Enter your name", text: $name)
                                .keyboardType(.namePhonePad)
                                .disableAutocorrection(true)
                                .submitLabel(.done)
                                // Use @FocusState to support this
                                // .focused($nameIsFocused)
                                .onSubmit {
                                    print("\(name)")
                                }
                        } else {
                            TextField("Enter your name", text: $name)
                                .keyboardType(.namePhonePad)
                                .disableAutocorrection(true)
                                .introspectTextField { textField in
                                    if textField.canBecomeFirstResponder {
                                        textField.becomeFirstResponder()
                                    }
                                }
                        }
                        GenderPickerView()
                        DatePickerView()
                    }
                    Section(header: Text("Welcome to SwiftUI.")) {
                        Text("You are starting very good.")
                        Text("I like your sprit and dedication.")
                        // Available in iOS 15.0
                            // .listRowSeparator(.hidden)
                            // .listRowSeparatorTint(.red)
                            // .listRowSeparator(.visible, edges: .top)
                    }
                    if #available(iOS 15.0, *) {
                        // Direct string without Text view is availaable from iOS 15.0
                        Section("Very good") {
                            ForEach(1 ..< 11) { number in
                                Text("Row \(number)")
                            }
                        }
                    } else {
                        // Fallback on earlier versions
                    }
                }.frame(maxWidth: .infinity, alignment: .leading)
            }
            // Available from iOS 14.0
            // .listStyle(SidebarListStyle())
            // Available from iOS 15.0
            /*
            .onSubmit {
                print("Form submitted.")
            }
             */
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif
