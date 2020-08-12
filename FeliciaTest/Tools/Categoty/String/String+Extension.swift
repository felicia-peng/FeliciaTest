
//
//  String+Extension.swift
//  water_conservancy_ios
//
//  Created by codeLocker on 2019/8/25.
//  Copyright © 2019 codeLocker. All rights reserved.
//

import Foundation
import CommonCrypto
import UIKit

extension String {
    func es_md5() -> String {
        let cStr = self.cString(using: String.Encoding.utf8);
        let buffer = UnsafeMutablePointer<UInt8>.allocate(capacity: 16)
        CC_MD5(cStr!,(CC_LONG)(strlen(cStr!)), buffer)
        let md5String = NSMutableString();
        for i in 0 ..< 16{
            md5String.appendFormat("%02x", buffer[i])
        }
        free(buffer)
        return md5String as String
    }
    
    func es_nsRange(from range: Range<String.Index>?) -> NSRange {
        guard let range = range else {
            return NSRange.init(location: 0, length: 0)
        }
        let from = range.lowerBound.samePosition(in: utf16)
        let to = range.upperBound.samePosition(in: utf16)
        return NSRange(location: utf16.distance(from: utf16.startIndex, to: from!),
                       length: utf16.distance(from: from!, to: to!))

    }
    
    func es_width(for height: CGFloat, font: UIFont) -> CGFloat {
        var attStr = NSAttributedString.init(string: self)
        attStr = attStr.es_setFont(font, range: NSRange.init(location: 0, length: attStr.length)) ?? NSAttributedString.init(string: "")
        return attStr.es_width(for: height)
    }
    
    func es_removeBlank() -> String {
        return self.replacingOccurrences(of: " ", with: "")
    }
    
    func es_removeHeadBlank() -> String {
        let whitespace = NSCharacterSet.whitespaces
        return self.trimmingCharacters(in: whitespace)
    }
}
