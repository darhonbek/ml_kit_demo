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
    var delegate: ScanViewModelDelegate? { get set }
    func recognizeText(from image: UIImage)
}

// Replace delegate call with flow coordinator.
protocol ScanViewModelDelegate {
    func present(viewController: UIViewController)
}

class ScanViewModel: ScanViewModelProtocol {
    var delegate: ScanViewModelDelegate?

    private let textRecognizer: TextRecognizerProtocol
    private let patternDetector: VisionTextPatternDetectorProtocol
    private let context: CIContext
    private let viewModelFactory: VerificationViewModelFactoryProtocol.Type
    private let viewControllerFactory: VerificationViewControllerFactoryProtocol.Type
    private var isRecognitionInProgress = false

    init(textRecognizer: TextRecognizerProtocol = TextRecognizer(),
         patternDetector: VisionTextPatternDetectorProtocol = VisionTextPatternDetector(),
         context: CIContext = CIContext(),
         viewModelFactory: VerificationViewModelFactoryProtocol.Type = VerificationViewModelFactory.self,
         viewControllerFactory: VerificationViewControllerFactoryProtocol.Type = VerificationViewControllerFactory.self) {
        self.textRecognizer = textRecognizer
        self.patternDetector = patternDetector
        self.context = context
        self.viewModelFactory = viewModelFactory
        self.viewControllerFactory = viewControllerFactory
    }

    func recognizeText(from image: UIImage) {
        if !isRecognitionInProgress {
            isRecognitionInProgress = true

            textRecognizer.process(image) { [weak self] visionText, error in
                defer {
                    self?.isRecognitionInProgress = false
                }

                guard let self = self, let visionText = visionText else { return }

                self.patternDetector.detect(in: visionText) { imageTextDto in
                    if let dto = imageTextDto {
                        self.openVerificationScreen(with: dto, image: image)
                    }
                }
            }
        }
    }

    private func openVerificationScreen(with dto: ImageTextDTO, image: UIImage) {
        let imageTextModel = ImageTextModel(dto: dto, image: image)
        // Move code below to flow coordinator
        let viewModel = viewModelFactory.verificationViewModel(textModel: imageTextModel)
        let viewController = viewControllerFactory.verificationViewController(viewModel: viewModel)
        delegate?.present(viewController: viewController)
    }
}
