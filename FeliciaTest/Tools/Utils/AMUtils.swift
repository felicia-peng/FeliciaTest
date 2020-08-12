//
//  AMUtils.swift
//  donggang_strawberry_ios
//
//  Created by codeLocker on 2019/11/11.
//  Copyright © 2019 codeLocker. All rights reserved.
//

import UIKit

class AMUtils: NSObject {
    
    //MARK: - Test
    static let productImage: [String] = ["am_test_product_1", "am_test_product_2", "am_test_product_3", "am_test_product_4"]
    static func es_randomProductImage(count: Int) -> [String] {
        if count == 0 {
            return []
        }
        var images = [String]()
        for _ in 0 ..< count {
            let idx = Int.es_random(min: 0, max: (productImage.count - 1))
            images.append(productImage[idx])
        }
        return images
    }
    
    static func statusBarDark() {
        UIApplication.shared.statusBarStyle = .default
    }
    
    static func statusBarLight() {
        UIApplication.shared.statusBarStyle = .lightContent
    }
   
    static func isEmptyString(_ string: String?) -> Bool {
        guard let str = string, str.count > 0 else {
            return true
        }
        return false
    }
    
    static func isValidPhone(_ phone: String?) -> Bool {
        if self.isEmptyString(phone) {
            return false
        }
        if  phone!.count != 11 {
            return false
        }
        return true
    }
    
    static func isValidPassword(_ phone: String?) -> Bool {
        if self.isEmptyString(phone) {
            return false
        }
        if  phone!.count >= 6 && phone!.count <= 12 {
            return true
        }
        return false
    }
    
    static func showHint(_ str: String) {
        UIApplication.shared.keyWindow?.es_hint(str)
    }
}
