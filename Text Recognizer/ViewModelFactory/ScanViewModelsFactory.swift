//
//  ScanViewModelFactory.swift
//  Text Recognizer
//
//  Created by Darkhonbek Mamataliev on 21/11/19.
//  Copyright © 2019 Darkhonbek Mamataliev. All rights reserved.
//

protocol ScanViewModelFactoryProtocol {
    static func scanViewModel(textRecognizer: TextRecognizerProtocol) -> ScanViewModelProtocol
}

final class ScanViewModelFactory: ScanViewModelFactoryProtocol {
    static func scanViewModel(textRecognizer: TextRecognizerProtocol) -> ScanViewModelProtocol {
        return ScanViewModel(textRecognizer: textRecognizer)
    }
}
