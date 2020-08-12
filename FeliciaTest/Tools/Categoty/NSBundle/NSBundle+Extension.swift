//
//  NSBundle+Extension.swift
//  water_conservancy_ios
//
//  Created by codeLocker on 2019/8/11.
//  Copyright © 2019 codeLocker. All rights reserved.
//

import Foundation
import UIKit

extension Bundle {
    var es_version : String {
        get {
            let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
            return version ?? "0.0.0"
        }
    }
}
