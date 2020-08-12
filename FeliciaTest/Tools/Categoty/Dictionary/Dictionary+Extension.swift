//
//  Dictionary+Extension.swift
//  water_conservancy_ios
//
//  Created by codeLocker on 2019/10/28.
//  Copyright © 2019 codeLocker. All rights reserved.
//

import Foundation

extension Dictionary {
    
    static func es_removeNilKey(dic: inout [String: Any?]) -> [String: Any] {
        for (key, value) in dic {
            if value is [String: Any?] {
                var tmp = value as! [String: Any?]
                let tmpValue = Dictionary.es_removeNilKey(dic: &tmp)
                dic[key] = tmpValue
            }
            if value == nil {
                dic.removeValue(forKey: key)
            }
        }
        return dic as [String : Any]
    }
    
    static func es_replaceNilKey(dic: inout [String: Any?], for placeholder: Any) -> [String: Any] {
        for (key, value) in dic {
            if value is [String: Any?] {
                var tmp = value as! [String: Any?]
                let tmpValue = Dictionary.es_replaceNilKey(dic: &tmp, for: placeholder)
                dic[key] = tmpValue
            }
            if value == nil {
                dic[key] = placeholder
            }
        }
        return dic as [String : Any]
    }
}
