//
//  PatternDetector.swift
//  Text Recognizer
//
//  Created by Darkhonbek Mamataliev on 24/11/19.
//  Copyright © 2019 Darkhonbek Mamataliev. All rights reserved.
//

import FirebaseMLVision

enum Regex: String {
    case carNumber = "[0-9]{2}[A-Za-z][0-9]{3}[A-Za-z]"
    // more regexes for different use cases
}

protocol VisionTextPatternDetectorProtocol {
    static func detect(in visionText: VisionText, regex: NSRegularExpression) -> VisionTextPatternDetectorResult?
}

class VisionTextPatternDetector: VisionTextPatternDetectorProtocol {
    static let carNumberRegex = NSRegularExpression(Regex.carNumber.rawValue)

    static func detect(in visionText: VisionText,
                       regex: NSRegularExpression = carNumberRegex) -> VisionTextPatternDetectorResult? {
        // TODO: - WIP
        // Search for pattern in entire content
//        visionText.text

        // Search for pattern in blocks
//        visionText.blocks

        // Search for pattern in lines
//        block.lines

        // Search for pattern in elements
//        line.elements

        return nil
    }
}
