//
//  TextRecognitionService.swift
//  Text Recognizer
//
//  Created by Darkhonbek Mamataliev on 21/11/19.
//  Copyright © 2019 Darkhonbek Mamataliev. All rights reserved.
//

import UIKit
import FirebaseMLVision

protocol TextRecognizerProtocol {
    func process(_ image: UIImage, completion: @escaping VisionTextRecognitionCallback)
}

class TextRecognizer: TextRecognizerProtocol {
    var isProcessing: Bool

    private let visionTextRecognizer: VisionTextRecognizer
    private let visionImageType: VisionImage.Type

    init(visionType: Vision.Type = Vision.self, visionImageType: VisionImage.Type = VisionImage.self) {
        self.visionImageType = visionImageType
        visionTextRecognizer = visionType.vision().onDeviceTextRecognizer()
        isProcessing = false
    }

    func process(_ image: UIImage, completion: @escaping VisionTextRecognitionCallback) {
        let visionImage = visionImageType.init(image: image)
        // Text recognition is happening here.
        visionTextRecognizer.process(visionImage, completion: completion)
    }
}
