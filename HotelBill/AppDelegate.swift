//
//  AppDelegate.swift
//  BillSplit
//
//  Created by global on 21/08/21.
//

import UIKit

class AppDelegate: UIResponder, UIApplicationDelegate {

    // var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.

        // Add the below code if we need to support iOS 12 as well and remove every scene related methods
        // We can't use SwiftUI also with iOS 12. So, we need to use UIKit instead of SwiftUI at that time
        /*
        let window = UIWindow(frame: UIScreen.main.bounds)
        // Load any view controller as root view controller we can even load from storyboard
        window.rootViewController = UIViewController()
        self.window = window
        window.makeKeyAndVisible()
         */
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.

        // Apply scene configuration programatically for storyboard based projects instead from the Info.plist
        /*
        if connectingSceneSession.role == UISceneSession.Role.windowApplication {
            let config = UISceneConfiguration(name: nil, sessionRole: connectingSceneSession.role)
            config.delegateClass = SceneDelegate.self
            config.storyboard = UIStoryboard(name: "Main", bundle: nil)
            return config
        }
        fatalError("Unhandled scene role \(connectingSceneSession.role)")
         */
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }

}
