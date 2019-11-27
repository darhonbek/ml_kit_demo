//
//  VerificationViewController.swift
//  Text Recognizer
//
//  Created by Darkhonbek Mamataliev on 25/11/19.
//  Copyright © 2019 Darkhonbek Mamataliev. All rights reserved.
//

import UIKit

class VerificationViewController: UIViewController {
    private let viewModel: VerificationViewModelProtocol

    init(viewModel: VerificationViewModelProtocol) {
        self.viewModel = viewModel

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
