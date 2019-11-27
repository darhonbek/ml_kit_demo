//
//  VerificationViewControllerFactory.swift
//  Text Recognizer
//
//  Created by Darkhonbek Mamataliev on 27/11/19.
//  Copyright © 2019 Darkhonbek Mamataliev. All rights reserved.
//

import UIKit

protocol VerificationViewControllerFactoryProtocol {
    static func verificationViewController(viewModel: VerificationViewModelProtocol) -> UIViewController
}

final class VerificationViewControllerFactory: VerificationViewControllerFactoryProtocol {
    static func verificationViewController(viewModel: VerificationViewModelProtocol) -> UIViewController {
        return VerificationViewController(viewModel: viewModel)
    }
}
