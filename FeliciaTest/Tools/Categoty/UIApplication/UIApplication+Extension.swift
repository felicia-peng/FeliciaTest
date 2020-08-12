//
//  UIApplication+Extension.swift
//  donggang_strawberry_ios
//
//  Created by codeLocker on 2019/11/26.
//  Copyright © 2019 codeLocker. All rights reserved.
//

import UIKit

extension UIApplication {
    static func es_hideKeyboard() {
        UIApplication.shared.sendAction(#selector(resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
    static func es_rootViewController() -> UIViewController? {
        return UIApplication.shared.keyWindow?.rootViewController
    }
}
