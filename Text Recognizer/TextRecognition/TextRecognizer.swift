//
//  TextRecognitionService.swift
//  Text Recognizer
//
//  Created by Darkhonbek Mamataliev on 21/11/19.
//  Copyright © 2019 Darkhonbek Mamataliev. All rights reserved.
//

import FirebaseMLVision

protocol VisionImageProtocol {
    // ...
}

protocol TextRecognizerProtocol {
    func process(_ image: VisionImageProtocol, completion: @escaping VisionTextRecognitionCallback)
}

class TextRecognizer: TextRecognizerProtocol {

    func process(_ image: VisionImageProtocol, completion: @escaping VisionTextRecognitionCallback) {
        // ...
    }
}
