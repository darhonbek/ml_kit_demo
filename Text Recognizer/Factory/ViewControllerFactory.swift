//
//  ViewControllerFactory.swift
//  Text Recognizer
//
//  Created by Darkhonbek Mamataliev on 21/11/19.
//  Copyright © 2019 Darkhonbek Mamataliev. All rights reserved.
//

import UIKit

protocol ViewControllerFactoryProtocol {
    static func scanViewController(viewModel: ScanViewModelProtocol) -> UIViewController
    static func verificationViewController(viewModel: VerificationViewModelProtocol) -> UIViewController
}

final class ViewControllerFactory: ViewControllerFactoryProtocol {
    static func scanViewController(viewModel: ScanViewModelProtocol) -> UIViewController {
        return ScanViewController(viewModel: viewModel)
    }

    static func verificationViewController(viewModel: VerificationViewModelProtocol) -> UIViewController {
        return VerificationViewController(viewModel: viewModel)
    }
}
