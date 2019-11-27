//
//  VerificationViewModel.swift
//  Text Recognizer
//
//  Created by Darkhonbek Mamataliev on 25/11/19.
//  Copyright © 2019 Darkhonbek Mamataliev. All rights reserved.
//

protocol VerificationViewModelProtocol {
    var textModel: ImageTextModel { get }
}

class VerificationViewModel: VerificationViewModelProtocol {
    var textModel: ImageTextModel

    init(textModel: ImageTextModel) {
        self.textModel = textModel
    }
}
