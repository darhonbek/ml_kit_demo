//
//  ScanViewModel.swift
//  Text Recognizer
//
//  Created by Darkhonbek Mamataliev on 18/11/19.
//  Copyright © 2019 Darkhonbek Mamataliev. All rights reserved.
//

import AVFoundation
import UIKit

protocol ScanViewModelProtocol {
    func recognizeText(from image: UIImage)
}

class ScanViewModel: ScanViewModelProtocol {
    private let textRecognizer: TextRecognizerProtocol
    private let patternDetector: VisionTextPatternDetectorProtocol
    private let context: CIContext
    private var isRecognitionInProgress = false

    init(textRecognizer: TextRecognizerProtocol = TextRecognizer(),
         patternDetector: VisionTextPatternDetectorProtocol = VisionTextPatternDetector(),
         context: CIContext = CIContext()) {
        self.textRecognizer = textRecognizer
        self.patternDetector = patternDetector
        self.context = context
    }

    func recognizeText(from image: UIImage) {
        if !isRecognitionInProgress {
            isRecognitionInProgress = true

            textRecognizer.process(image) { [weak self] visionText, error in
                guard let self = self else { return }

                self.isRecognitionInProgress = false

                guard let visionText = visionText else { return }

                if let result = self.patternDetector.detect(in: visionText) {
                    print("Car detected: \(result.text)")
                }
            }
        }
    }
}
