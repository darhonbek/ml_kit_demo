//
//  VerificationViewModelFactory.swift
//  Text Recognizer
//
//  Created by Darkhonbek Mamataliev on 26/11/19.
//  Copyright © 2019 Darkhonbek Mamataliev. All rights reserved.
//

protocol VerificationViewModelFactoryProtocol {
    static func verificationViewModel(textModel: ImageTextModel) -> VerificationViewModelProtocol
}

final class VerificationViewModelFactory: VerificationViewModelFactoryProtocol {
    static func verificationViewModel(textModel: ImageTextModel) -> VerificationViewModelProtocol {
        return VerificationViewModel(textModel: textModel)
    }
}
