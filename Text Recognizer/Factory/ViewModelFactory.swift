//
//  ViewModelFactory.swift
//  Text Recognizer
//
//  Created by Darkhonbek Mamataliev on 21/11/19.
//  Copyright © 2019 Darkhonbek Mamataliev. All rights reserved.
//

protocol ViewModelFactoryProtocol {
    static func scanViewModel(textRecognizer: TextRecognizerProtocol) -> ScanViewModelProtocol
    static func verificationViewModel(textModel: ImageTextModel) -> VerificationViewModelProtocol
}

final class ViewModelFactory: ViewModelFactoryProtocol {
    static func scanViewModel(textRecognizer: TextRecognizerProtocol) -> ScanViewModelProtocol {
        return ScanViewModel(textRecognizer: textRecognizer)
    }

    static func verificationViewModel(textModel: ImageTextModel) -> VerificationViewModelProtocol {
        return VerificationViewModel(textModel: textModel)
    }
}
