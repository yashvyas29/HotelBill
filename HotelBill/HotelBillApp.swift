//
//  HotelBillApp.swift
//  HotelBill
//
//  Created by global on 21/08/21.
//

import SwiftUI

@main
// To support iOS 13 as well we need a wrapper
struct HotelBillAppWrapper {
    static func main() {
        if #available(iOS 14.0, *) {
            HotelBillApp.main()
        }
        else {
            UIApplicationMain(CommandLine.argc, CommandLine.unsafeArgv, nil, NSStringFromClass(AppDelegate.self))
        }
    }
}

@available(iOS 14.0, *)
struct HotelBillApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
