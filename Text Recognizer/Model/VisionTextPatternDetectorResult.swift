//
//  VisionTextPatternDetectorResult.swift
//  Text Recognizer
//
//  Created by Darkhonbek Mamataliev on 24/11/19.
//  Copyright © 2019 Darkhonbek Mamataliev. All rights reserved.
//

import CoreGraphics

struct VisionTextPatternDetectorResult {
    let text: String
    let frame: CGRect

    init(text: String, frame: CGRect) {
        self.text = text
        self.frame = frame
    }
}
