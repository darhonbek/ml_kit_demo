//
//  AppDelegate.swift
//  Text Recognizer
//
//  Created by Darkhonbek Mamataliev on 13/11/19.
//  Copyright © 2019 Darkhonbek Mamataliev. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setupFirstScreen()

        return true
    }

    /**
     Initializes and launches window with `viewController`.
     */
    private func setupFirstScreen() {
        let viewController = ScanViewController()

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = viewController
        window?.makeKeyAndVisible()
    }
}

// MARK: - UIApplicationDelegate

extension AppDelegate {
    func applicationWillResignActive(_ application: UIApplication) {
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
    }

    func applicationWillTerminate(_ application: UIApplication) {
    }
}

