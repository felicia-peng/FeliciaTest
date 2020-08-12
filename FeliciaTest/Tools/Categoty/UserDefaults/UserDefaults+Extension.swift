//
//  UserDefaults+Extension.swift
//  test
//
//  Created by codeLocker on 2019/8/30.
//  Copyright © 2019 codeLocker. All rights reserved.
//

import Foundation

extension UserDefaults {
    static func es_set(value: Int, forKey: String) {
        if forKey.isEmpty {
            return
        }
        UserDefaults.standard.set(value, forKey: forKey)
        UserDefaults.standard.synchronize()
    }
    
    static func es_set(value: URL, forKey: String) {
        if forKey.isEmpty {
            return
        }
        UserDefaults.standard.set(value, forKey: forKey)
        UserDefaults.standard.synchronize()
    }
    
    static func es_set(value: Bool, forKey: String) {
        if forKey.isEmpty {
            return
        }
        UserDefaults.standard.set(value, forKey: forKey)
        UserDefaults.standard.synchronize()
    }
    
    static func es_set(value: Double, forKey: String) {
        if forKey.isEmpty {
            return
        }
        UserDefaults.standard.set(value, forKey: forKey)
        UserDefaults.standard.synchronize()
    }
    
    static func es_set(value: Float, forKey: String) {
        if forKey.isEmpty {
            return
        }
        UserDefaults.standard.set(value, forKey: forKey)
        UserDefaults.standard.synchronize()
    }
    
    static func es_set(value: Array<Any>, forKey: String) {
        if forKey.isEmpty {
            return
        }
        UserDefaults.standard.set(value, forKey: forKey)
        UserDefaults.standard.synchronize()
    }
    
    static func es_set(value: Dictionary<String, Any>, forKey: String) {
        if forKey.isEmpty {
            return
        }
        UserDefaults.standard.set(value, forKey: forKey)
        UserDefaults.standard.synchronize()
    }
    
    static func es_set(value: Data, forKey: String) {
        if forKey.isEmpty {
            return
        }
        UserDefaults.standard.set(value, forKey: forKey)
        UserDefaults.standard.synchronize()
    }
    
    static func es_set(value: String, forKey: String) {
        if forKey.isEmpty {
            return
        }
        UserDefaults.standard.set(value, forKey: forKey)
        UserDefaults.standard.synchronize()
    }
    
    static func es_int(forKey: String) -> Int? {
        if forKey.isEmpty {
            return nil
        }
        let value = UserDefaults.standard.value(forKey: forKey)
        return value as? Int
    }
    
    static func es_url(forKey: String) -> URL? {
        if forKey.isEmpty {
            return nil
        }
        let value = UserDefaults.standard.value(forKey: forKey)
        return value as? URL
    }
    
    static func es_bool(forKey: String) -> Bool? {
        if forKey.isEmpty {
            return nil
        }
        let value = UserDefaults.standard.value(forKey: forKey)
        return value as? Bool
    }
    
    static func es_double(forKey: String) -> Double? {
        if forKey.isEmpty {
            return nil
        }
        let value = UserDefaults.standard.value(forKey: forKey)
        return value as? Double
    }
    
    static func es_float(forKey: String) -> Float? {
        if forKey.isEmpty {
            return nil
        }
        let value = UserDefaults.standard.value(forKey: forKey)
        return value as? Float
    }
    
    static func es_array(forKey: String) -> Array<Any>? {
        if forKey.isEmpty {
            return nil
        }
        let value = UserDefaults.standard.value(forKey: forKey)
        return value as? Array
    }
    
    static func es_dictionary(forKey: String) -> Dictionary<String, Any>? {
        if forKey.isEmpty {
            return nil
        }
        let value = UserDefaults.standard.value(forKey: forKey)
        return value as? Dictionary
    }
    
    static func es_data(forKey: String) -> Data? {
        if forKey.isEmpty {
            return nil
        }
        let value = UserDefaults.standard.value(forKey: forKey)
        return value as? Data
    }
    
    static func es_string(forKey: String) -> String? {
        if forKey.isEmpty {
            return nil
        }
        let value = UserDefaults.standard.value(forKey: forKey)
        return value as? String
    }
    
    static func es_remove(forKey: String) {
        if forKey.isEmpty {
            return
        }
        UserDefaults.standard.removeObject(forKey: forKey)
        UserDefaults.standard.synchronize()
    }
}
