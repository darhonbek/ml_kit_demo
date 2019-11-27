//
//  ScanViewControllerFactory.swift
//  Text Recognizer
//
//  Created by Darkhonbek Mamataliev on 21/11/19.
//  Copyright © 2019 Darkhonbek Mamataliev. All rights reserved.
//

import UIKit

protocol ScanViewControllerFactoryProtocol {
    static func scanViewController(viewModel: ScanViewModelProtocol) -> UIViewController
}

final class ScanViewControllerFactory: ScanViewControllerFactoryProtocol {
    static func scanViewController(viewModel: ScanViewModelProtocol) -> UIViewController {
        return ScanViewController(viewModel: viewModel)
    }
}
