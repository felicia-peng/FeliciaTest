//
//  ESNetworkResponse.swift
//  donggang_strawberry_ios
//
//  Created by codeLocker on 2019/11/26.
//  Copyright © 2019 codeLocker. All rights reserved.
//

import UIKit

struct ESNetworkResponse: Codable {
    var code: Int
    var msg: String?
}

struct AMCollectResponse: Codable {
    var code: Int
    var msg: String?
    var data: Int?
}
