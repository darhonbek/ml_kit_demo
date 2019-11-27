//
//  ImageTextModel.swift
//  Text Recognizer
//
//  Created by Darkhonbek Mamataliev on 24/11/19.
//  Copyright © 2019 Darkhonbek Mamataliev. All rights reserved.
//

import UIKit
import CoreGraphics

struct ImageTextModel {
    let text: String
    let image: UIImage?
}

extension ImageTextModel {
    init(dto: ImageTextDTO, image: UIImage) {
        self.text = dto.text
        self.image = image.cropping(to: dto.frame)
    }
}
