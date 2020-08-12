//
//  AMLocationManager.swift
//  donggang_strawberry_ios
//
//  Created by codeLocker on 2019/12/7.
//  Copyright © 2019 codeLocker. All rights reserved.
//

import UIKit

class AMLocationManager: NSObject {
    static let locationManager = CLLocationManager()
    
    static var status: CLAuthorizationStatus {
        get {
            return CLLocationManager.authorizationStatus()
        }
    }
    
    static func requestAuth() {
        AMLocationManager.locationManager.requestAlwaysAuthorization()
        AMLocationManager.locationManager.requestWhenInUseAuthorization()
    }
}
