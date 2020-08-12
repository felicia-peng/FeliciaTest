//
//  UIViewController+Extension.swift
//  water_conservancy_ios
//
//  Created by codeLocker on 2019/8/22.
//  Copyright © 2019 codeLocker. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    func es_showAlert(title: String?, message: String?, cancel: ((UIAlertAction) -> Void)?, confirm: ((UIAlertAction) -> Void)?) {
        let alertVc = UIAlertController.init(title: title, message: message, preferredStyle: .alert)
        let cancelAction = UIAlertAction.init(title: "取消", style: .default) { (action) in
            cancel?(action)
        }
        let confirmAction = UIAlertAction.init(title: "确定", style: .default) { (action) in
            confirm?(action)
        }
        alertVc.addAction(cancelAction)
        alertVc.addAction(confirmAction)
        self.present(alertVc, animated: true, completion: nil)
    }
    
    func es_showCancelAlert(title: String?, message: String?, cancel: ((UIAlertAction) -> Void)?, confirm: ((UIAlertAction) -> Void)?) {
        let alertVc = UIAlertController.init(title: title, message: message, preferredStyle: .alert)
        let cancelAction = UIAlertAction.init(title: "取消", style: .default) { (action) in
            cancel?(action)
        }
        alertVc.addAction(cancelAction)
        self.present(alertVc, animated: true, completion: nil)
    }
}
