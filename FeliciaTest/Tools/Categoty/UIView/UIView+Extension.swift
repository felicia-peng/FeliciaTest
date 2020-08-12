//
//  UIView+Extension.swift
//  water_conservancy_ios
//
//  Created by codeLocker on 2019/8/11.
//  Copyright © 2019 codeLocker. All rights reserved.
//

import Foundation
import UIKit
import MBProgressHUD

extension UIView {
    var es_width : CGFloat {
        
        set{
            self.frame = CGRect.init(x: self.frame.origin.x, y: self.frame.origin.y, width: newValue, height: self.frame.size.height)
        }
        get{
            return self.frame.size.width
        }
    }
    
    var es_height : CGFloat {
        
        set{
            self.frame = CGRect.init(x: self.frame.origin.x, y: self.frame.origin.y, width: self.frame.size.width, height: newValue)
        }
        get{
            return self.frame.size.height
        }
    }
    
    var es_minX : CGFloat {
        
        set{
            self.frame = CGRect.init(x: newValue, y: self.frame.origin.y, width: self.es_width, height: self.es_height)
        }
        get{
            return self.frame.origin.x
        }
    }
    
    var es_minY : CGFloat {
        
        set{
            self.frame = CGRect.init(x: self.frame.origin.x, y: newValue, width: self.es_width, height: self.es_height)
        }
        get{
            return self.frame.origin.y
        }
    }
    
    var es_maxX : CGFloat {
        
        set{
            self.frame = CGRect.init(x: newValue - self.es_width, y: self.es_minY, width: self.es_width, height: self.es_height)
        }
        get{
            return self.es_minX + self.es_width
        }
    }
    
    var es_maxY : CGFloat {
        
        set{
            self.frame = CGRect.init(x: self.es_minX, y: newValue - self.es_minY, width: self.es_width, height: self.es_height)
        }
        get{
            return self.es_minY + self.es_height
        }
    }
    
    var es_midX : CGFloat {
        
        set{
            self.frame = CGRect.init(x: newValue - self.es_width/2.0, y: self.es_minY, width: self.es_width, height: self.es_height)
        }
        get{
            return self.center.x
        }
    }
    
    var es_midY : CGFloat {
        
        set{
            self.frame = CGRect.init(x: self.es_minX, y: newValue - self.es_height/2.0, width: self.es_width, height: self.es_height)
        }
        get{
            
            return self.center.y
        }
    }
}

extension UIView {
    
    /// 设置圆角
    ///
    /// - Parameters:
    ///   - corner: 圆角
    ///   - radius: 半径
    public func es_set(corner: UIRectCorner, radius: CGFloat) {
        let mask = UIBezierPath.init(roundedRect: self.bounds, byRoundingCorners: corner, cornerRadii: CGSize.init(width: radius, height: radius))
        let maskLayer = CAShapeLayer.init()
        maskLayer.frame = self.bounds
        maskLayer.path = mask.cgPath
        self.layer.mask = maskLayer
    }
}

//HUD
extension UIView {
    func es_showHUD(_ message: String?) {
        let hud = MBProgressHUD.showAdded(to: self, animated: true)
        hud.mode = .indeterminate;
        hud.label.text = message;
        hud.contentColor = .white;
        hud.removeFromSuperViewOnHide = true;
        hud.bezelView.color = UIColor.black.withAlphaComponent(0.618)
    }
    
    func es_hideHUD() {
        MBProgressHUD.hide(for: self, animated: true)
    }
    
    func es_hint(_ message: String?) {
        self.es_hint(message, delay: 1.5, offset: CGPoint.zero)
    }
    
    func es_hint(_ message: String?, delay: TimeInterval) {
        self.es_hint(message, delay: delay, offset: CGPoint.zero)
    }
    
    func es_hint(_ message: String?, offset: CGPoint) {
        self.es_hint(message, delay: 1.5, offset: offset)
    }
    
    func es_hint(_ message: String?, delay: TimeInterval, offset: CGPoint) {
        let hud = MBProgressHUD.showAdded(to: self, animated: true)
        hud.mode = .text
        hud.label.text = message
        hud.label.font = UIFont.systemFont(ofSize: 15)
        hud.contentColor = .white
        hud.removeFromSuperViewOnHide = true
        hud.bezelView.color = UIColor.black.withAlphaComponent(0.618)
        hud.margin = 10
        hud.offset = offset
        hud.hide(animated: true, afterDelay: delay)
    }
    
}
