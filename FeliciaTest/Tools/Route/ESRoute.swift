//
//  ESRoute.swift
//  water_conservancy_ios
//
//  Created by codeLocker on 2019/8/31.
//  Copyright © 2019 codeLocker. All rights reserved.
//

import UIKit

class ESRoute: NSObject {
    static func route(to: AnyClass?, params: [String: Any]?) {
        if to == nil {
            return
        }
        var class_name = String(describing: to.self)
        if let range = class_name.range(of: "Optional(") {
            class_name.removeSubrange(range)
        }
        if let range = class_name.range(of: ")") {
            class_name.removeSubrange(range)
        }
        if class_name.isEmpty {
            return
        }

        guard let viewController_class = NSClassFromString(class_name) as? AMViewController.Type else {
            return
        }
        guard let nav = ESRoute.currentVisibleNavigationController() else {
            return
        }
        let vc = viewController_class.init()
        vc.params = params
        vc.hidesBottomBarWhenPushed = true
        nav.pushViewController(vc, animated: true)
        
    }
    
    static func pop() {
        guard let nav = ESRoute.currentVisibleNavigationController() else {
            return
        }
        nav.popViewController(animated: true)
    }
    
    static func currentVisibleNavigationController() -> UINavigationController? {
        let rootVc = UIApplication.shared.keyWindow?.rootViewController
        
        if rootVc is UITabBarController, let vc = rootVc as? UITabBarController {
            
            if let presentedVc = rootVc?.presentedViewController {
                if presentedVc is UINavigationController, let navVc = presentedVc as? UINavigationController {
                    return navVc
                } else {
                    return nil
                }
            }

            let selectVc = vc.selectedViewController
            if selectVc is UINavigationController, let navVc = selectVc as? UINavigationController {
                return navVc
            } else {
                return nil
            }
        } else {
            if rootVc is UINavigationController?, let navVc = rootVc as? UINavigationController {
                return navVc
            } else {
                return nil
            }
        }
    }
    
//    static func routeToLogin() {
//        if !(AMUser.user?.isLogin ?? false) {
//            let loginVc = AMLoginViewController()
//            loginVc.showCloseButton = true
//            let nav = AMNavigationController.init(rootViewController: loginVc)
//            nav.es_setTranslucent(true)
//            nav.navigationBar.setBackgroundImage(UIImage(), for: .default)
//            nav.navigationBar.shadowImage = UIImage()
//            nav.modalPresentationStyle = .fullScreen
//            UIApplication.shared.keyWindow?.rootViewController?.present(nav, animated: true, completion: nil)
//        }
//    }
    
    static func routeToImagePickerController(delegate: (UIImagePickerControllerDelegate & UINavigationControllerDelegate)) {
        let actionSheet = UIAlertController.init(title: nil, message: nil, preferredStyle: .actionSheet)
        let albumAction = UIAlertAction.init(title: "从相册选择", style: .default) { (action) in
            let imagePickerVc = UIImagePickerController.init()
            imagePickerVc.sourceType = .photoLibrary
            imagePickerVc.mediaTypes = ["public.image"]
            imagePickerVc.delegate = delegate
            UIApplication.shared.keyWindow?.rootViewController?.present(imagePickerVc, animated: true, completion: nil)
        }
        let cameraAction = UIAlertAction.init(title: "拍照", style: .default) { (action) in
            let imagePickerVc = UIImagePickerController.init()
            imagePickerVc.sourceType = .camera
            imagePickerVc.delegate = delegate
            UIApplication.shared.keyWindow?.rootViewController?.present(imagePickerVc, animated: true, completion: nil)
        }
        let cancelAction = UIAlertAction.init(title: "取消", style: .cancel) { (action) in
            
        }
        actionSheet.addAction(cameraAction)
        actionSheet.addAction(albumAction)
        actionSheet.addAction(cancelAction)
        UIApplication.shared.keyWindow?.rootViewController?.present(actionSheet, animated: true, completion: nil)
    }
}
