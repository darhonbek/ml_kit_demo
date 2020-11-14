//
//  AppDelegate.swift
//  Text Recognizer
//
//  Created by Darkhonbek Mamataliev on 13/11/19.
//  Copyright © 2019 Darkhonbek Mamataliev. All rights reserved.
//

import UIKit
import Firebase

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        setupFirstScreen()

        return true
    }

    /**
     Initializes and launches window with `scanViewController`.
     */
    private func setupFirstScreen() {
        let textRecognizer = TextRecognizer()
        let viewModel = ViewModelFactory.scanViewModel(textRecognizer: textRecognizer)
        let viewController = ViewControllerFactory.scanViewController(viewModel: viewModel)

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = viewController
        window?.makeKeyAndVisible()
    }
}
