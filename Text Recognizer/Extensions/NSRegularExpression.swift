//
//  NSRegularExpression.swift
//  Text Recognizer
//
//  Created by Darkhonbek Mamataliev on 25/11/19.
//  Copyright © 2019 Darkhonbek Mamataliev. All rights reserved.
//

import Foundation

extension NSRegularExpression {
    convenience init(_ pattern: String) {
        do {
            try self.init(pattern: pattern)
        } catch {
            preconditionFailure("Illegal regular expression: \(pattern).")
        }
    }

    func matches(_ string: String) -> Bool {
        let range = NSRange(location: 0, length: string.utf16.count)
        return firstMatch(in: string, options: [], range: range) != nil
    }
}
