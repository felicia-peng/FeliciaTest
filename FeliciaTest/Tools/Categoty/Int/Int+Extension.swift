//
//  Int+Extension.swift
//  water_conservancy_ios
//
//  Created by codeLocker on 2019/8/18.
//  Copyright © 2019 codeLocker. All rights reserved.
//

import Foundation

extension Int {
    static func es_random(min: Int, max: Int) -> Int {
        return Int((arc4random() % UInt32(max + 1)) + UInt32(min))
    }
}
