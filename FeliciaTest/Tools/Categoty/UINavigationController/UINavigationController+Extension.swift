//
//  UINavigationController+Extension.swift
//  water_conservancy_ios
//
//  Created by codeLocker on 2019/10/23.
//  Copyright © 2019 codeLocker. All rights reserved.
//

import Foundation
import UIKit

extension UINavigationController {
    
    func es_setTranslucent(_ translucent: Bool) {
        self.navigationBar.isTranslucent = translucent
    }
    
    func es_setBarTintColor(_ color: UIColor) {
        self.navigationBar.barTintColor = color
    }
    
    func es_hideNavigationBarBottomLine() {
        self.navigationBar.shadowImage = UIImage()
    }

    func es_setTitle(color: UIColor, font: UIFont) {
        self.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor:color, NSAttributedString.Key.font:font]
    }
    
    func es_pop(index: Int) {
        if index == 0 {
            return
        }
        if index == 1 {
            self.popViewController(animated: true)
            return
        }
        if self.viewControllers.count < index + 1 {
            self.popToRootViewController(animated: true)
            return
        }
        let vc: UIViewController = self.viewControllers[self.viewControllers.count - (index + 1)];
        self.popToViewController(vc, animated: true)
    }
}
