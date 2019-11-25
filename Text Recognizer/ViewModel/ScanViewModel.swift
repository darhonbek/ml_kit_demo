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
    func recognizeText(from sampleBuffer: CMSampleBuffer)
}

class ScanViewModel: ScanViewModelProtocol {
    private let textRecognizer: TextRecognizerProtocol
    private let context: CIContext
    private var isRecognitionInProgress = false

    init(textRecognizer: TextRecognizerProtocol = TextRecognizer(), context: CIContext = CIContext()) {
        self.textRecognizer = textRecognizer
        self.context = context
    }

    func recognizeText(from sampleBuffer: CMSampleBuffer) {
        if !isRecognitionInProgress {
            isRecognitionInProgress = true

            guard let image = makeImage(from: sampleBuffer) else {
                isRecognitionInProgress = false
                return
            }

            textRecognizer.process(image) { visionText, error in
                // ...
            }
        }
    }
}

extension ScanViewModel {
    private func makeImage(from sampleBuffer: CMSampleBuffer) -> UIImage? {
        guard let imageBuffer = CMSampleBufferGetImageBuffer(sampleBuffer) else { return nil }
        let ciImage = CIImage(cvPixelBuffer: imageBuffer)
        guard let cgImage = context.createCGImage(ciImage, from: ciImage.extent) else { return nil }
        return UIImage(cgImage: cgImage)
    }
}
