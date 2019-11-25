//
//  CMSampleBuffer+UIImage.swift
//  Text Recognizer
//
//  Created by Darkhonbek Mamataliev on 24/11/19.
//  Copyright © 2019 Darkhonbek Mamataliev. All rights reserved.
//

import AVKit

extension CMSampleBuffer {
    func toImage(videoOrientation: AVCaptureVideoOrientation) -> UIImage? {
        guard let imageBuffer = CMSampleBufferGetImageBuffer(self) else { return nil }

        var ciImage = CIImage(cvPixelBuffer: imageBuffer)

        switch videoOrientation {
        case .landscapeLeft:
            ciImage = ciImage.oriented(forExifOrientation: 3)
        case .landscapeRight:
            ciImage = ciImage.oriented(forExifOrientation: 1)
        case .portrait:
            ciImage = ciImage.oriented(forExifOrientation: 6)
        case .portraitUpsideDown:
            ciImage = ciImage.oriented(forExifOrientation: 8)
        @unknown default:
            return nil
        }

        let context = CIContext()

        guard let cgImage = context.createCGImage(ciImage, from: ciImage.extent) else {
            return nil
        }

        return UIImage(cgImage: cgImage)
    }
}
