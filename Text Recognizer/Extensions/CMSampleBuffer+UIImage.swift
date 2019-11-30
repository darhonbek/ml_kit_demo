//
//  CMSampleBuffer+UIImage.swift
//  Text Recognizer
//
//  Created by Darkhonbek Mamataliev on 24/11/19.
//  Copyright © 2019 Darkhonbek Mamataliev. All rights reserved.
//

import AVKit

extension CMSampleBuffer {
    func toPortraitImage() -> UIImage? {
        guard let imageBuffer = CMSampleBufferGetImageBuffer(self) else { return nil }

        let ciImage = CIImage(cvPixelBuffer: imageBuffer).oriented(forExifOrientation: 6)
        let context = CIContext()

        guard let cgImage = context.createCGImage(ciImage, from: ciImage.extent) else {
            return nil
        }

        return UIImage(cgImage: cgImage)
    }
}
