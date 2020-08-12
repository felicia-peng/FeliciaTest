
//
//  NSAttributedString+Extension.swift
//  test
//
//  Created by codeLocker on 2019/8/24.
//  Copyright © 2019 codeLocker. All rights reserved.
//

import Foundation
import UIKit

extension NSAttributedString {
    func es_setColor(_ color: UIColor, range: NSRange) -> NSAttributedString? {
        let mutableAttributedString = NSMutableAttributedString.init(attributedString: self)
        mutableAttributedString.addAttributes([NSAttributedString.Key.foregroundColor: color], range: range)
        return mutableAttributedString.copy() as? NSAttributedString
    }
    
    func es_setFont(_ font: UIFont, range: NSRange) -> NSAttributedString? {
        let mutableAttributedString = NSMutableAttributedString.init(attributedString: self)
        mutableAttributedString.addAttributes([NSAttributedString.Key.font: font], range: range)
        return mutableAttributedString.copy() as? NSAttributedString
    }
    
    func es_setLinespace(_ space: CGFloat, breakMode: NSLineBreakMode, range: NSRange) -> NSAttributedString? {
        let style = NSMutableParagraphStyle()
        style.lineBreakMode = breakMode
        style.lineSpacing = space
        return self.es_setParagraphStyle(style, range: range)
    }
    
    func es_setParagraphStyle(_ style: NSParagraphStyle, range: NSRange) -> NSAttributedString? {
        let attStr = NSMutableAttributedString.init(attributedString: self)
        attStr.addAttribute(NSAttributedString.Key.paragraphStyle, value: style, range: range)
        return attStr.copy() as? NSAttributedString
    }
}

extension NSAttributedString {
    func es_height(for width: CGFloat) -> CGFloat {
        if width == 0 {
            return 0
        }
        return self.boundingRect(with: CGSize.init(width: width, height: 10000), options: [.usesFontLeading, .usesLineFragmentOrigin], context: nil).size.height
    }
    
    func es_width(for height: CGFloat) -> CGFloat {
        if height == 0 {
            return 0
        }
        return self.boundingRect(with: CGSize.init(width: 10000, height: height), options: [.usesFontLeading, .usesLineFragmentOrigin], context: nil).size.width
    }
}
