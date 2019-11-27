//
//  UIImage+crop.swift
//  Text Recognizer
//
//  Created by Darkhonbek Mamataliev on 26/11/19.
//  Copyright © 2019 Darkhonbek Mamataliev. All rights reserved.
//

import UIKit

extension UIImage {
    func cropping(to rect: CGRect) -> UIImage? {
        guard let cgImage = self.cgImage,
            let croppedCgImage = cgImage.cropping(to: rect) else { return nil }

        return UIImage(cgImage: croppedCgImage)
    }
}
