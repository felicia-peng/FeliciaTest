//
//  ESParser.swift
//  water_conservancy_ios
//
//  Created by codeLocker on 2019/8/25.
//  Copyright © 2019 codeLocker. All rights reserved.
//

import UIKit

class ESParser: NSObject {
    static func parser<T>(data: Any?, type: T.Type) -> T? where T : Decodable {
        guard let data = data else {
            return nil
        }
        let jsonDecoder = JSONDecoder()
        guard let jsonData = try? JSONSerialization.data(withJSONObject: data, options: []) else {
            return nil
        }
        guard let model = try? jsonDecoder.decode(type, from: jsonData) else {
            return nil
        }
        return model
    }
}
