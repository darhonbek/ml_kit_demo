//
//  VerificationViewModel.swift
//  Text Recognizer
//
//  Created by Darkhonbek Mamataliev on 25/11/19.
//  Copyright © 2019 Darkhonbek Mamataliev. All rights reserved.
//

import UIKit

protocol VerificationViewModelProtocol {
    var text: String { get }
    var image: UIImage? { get }
}

class VerificationViewModel: VerificationViewModelProtocol {
    var text: String {
        return textModel.text
    }
    var image: UIImage? {
        return textModel.image
    }

    private let textModel: ImageTextModel

    init(textModel: ImageTextModel) {
        self.textModel = textModel
    }
}
