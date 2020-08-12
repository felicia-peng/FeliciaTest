//
//  ESConstants.swift
//  water_conservancy_ios
//
//  Created by codeLocker on 2019/8/11.
//  Copyright © 2019 codeLocker. All rights reserved.
//

import UIKit

struct ESConstant {
    
    struct screen {
        /** 屏幕的宽*/
        static let width : CGFloat = UIScreen.main.bounds.width
        /** 屏幕的高*/
        static let height : CGFloat = UIScreen.main.bounds.height
        /** 屏幕的bounds*/
        static let bounds : CGRect = UIScreen.main.bounds
        /** 状态栏高度*/
        static let statusBarHeight : CGFloat = UIApplication.shared.statusBarFrame.size.height
        /** 导航栏高度*/
        static let navigationBarHeight : CGFloat = 44.0
        /** 底部安全距离*/
        static let bottomSafeMargin : CGFloat = ESConstant.screen.statusBarHeight > 20 ? 34 : 0
        
    }
    
    struct color {
        static let main : UIColor = UIColor.init(red: 0/255.0, green: 122/255.0, blue: 255/255.0, alpha: 1)
        static let text : UIColor = UIColor.init(red: 51/255.0, green: 51/255.0, blue: 51/255.0, alpha: 1)
        static let text_gray : UIColor = UIColor.init(red: 153/255.0, green: 153/255.0, blue: 153/255.0, alpha: 1)
//        static let text_warning : UIColor = UIColor.init(red: 219/255.0, green: 57/255.0, blue: 47/255.0, alpha: 1)
        static let background : UIColor = UIColor.init(red: 247.0/255.0, green: 247.0/255.0, blue: 247.0/255.0, alpha: 1)
    }
    
    struct font {
    
        enum PingFangSC : String {
            case medium     = "PingFangSC-Medium" //苹方-简 中黑体
            case semibold   = "PingFangSC-Semibold" //苹方-简 中粗体
            case light      = "PingFangSC-Light" //苹方-简 细体
            case ultralight = "PingFangSC-Ultralight" //苹方-简 极细体
            case regular    = "PingFangSC-Regular" //苹方-简 常规体
            case thin       = "PingFangSC-Thin" //苹方-简 纤细体
        }
        
        static func system(_ size: CGFloat) -> UIFont {
            return UIFont.systemFont(ofSize: size)
        }
        
        static func boldSystem(_ size: CGFloat) -> UIFont {
            return UIFont.boldSystemFont(ofSize: size)
        }
        
        static func pingFangSC(type: PingFangSC, size: CGFloat) -> UIFont {
            return UIFont.init(name: type.rawValue, size: size) ?? system(size)
        }
    }
    
    struct key {
        static let guide: String = "com.key.guide"
        static let account: String = "com.key.account"
        static let password: String = "com.key.password"
        static let login_type: String = "com.key.login.type"
        static let search_history_land: String = "com.key.search.history.land"
        static let search_history_new: String = "com.key.search.history.new"
        static let search_history_product: String = "com.key.search.history.product"
        static let search_history_professor: String = "com.key.search.history.professor"
        
        static let urora: String = "f53d0a4723ee081383e8d38a"
        static let amap: String = "bda38c98feef57e7a75387357bd67a24"
        
    }
    
    enum environment {
        case develop
        case product
        
        static let current: environment = .develop
        
        static let is_develop: Bool = ESConstant.environment.current == .develop
        static let is_product: Bool = ESConstant.environment.current == .product
    }
    
    static let isDebug: Bool = false
    
    
    enum channel: String {
        case app_store = "App Store"
    }
}
