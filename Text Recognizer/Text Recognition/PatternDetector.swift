//
//  PatternDetector.swift
//  Text Recognizer
//
//  Created by Darkhonbek Mamataliev on 24/11/19.
//  Copyright © 2019 Darkhonbek Mamataliev. All rights reserved.
//

import FirebaseMLVision

enum Regex: String {
    case carNumber = "[0-9]{2}[A-Za-z][0-9]{3}[A-Za-z]{2}"  // 01A123AA
    case cardNumber = "[0-9]{16}"                           // 1234567890123456
    case studentId = "U[0-9]{7}"                            // U1710001
}

protocol VisionTextPatternDetectorProtocol {
    func detect(in visionText: VisionText, completion: @escaping (ImageTextDTO?) -> Void)
}

class VisionTextPatternDetector: VisionTextPatternDetectorProtocol {
    private let regex: NSRegularExpression

    init(regex: NSRegularExpression = NSRegularExpression(Regex.carNumber.rawValue)) {
        self.regex = regex
    }

    func detect(in visionText: VisionText, completion: @escaping (ImageTextDTO?) -> Void) {
        var dto: ImageTextDTO?

        for block in visionText.blocks {
            for line in block.lines where regex.matches(line.text) {
                dto = ImageTextDTO(text: line.text, frame: line.frame)
                break
            }
        }

        completion(dto)
    }
}
