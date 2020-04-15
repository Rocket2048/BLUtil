//
//  BLValue.swift
//  BLUtil
//
//  Created by lin bo on 2019/3/19.
//  Copyright © 2018-2028 lin bo. All rights reserved.
//

import UIKit

public class JYValue: NSObject {

    /// string 转 data
    public static func string2data(from string: String) -> Data? {
        
       return string.data(using: String.Encoding(rawValue: String.Encoding.utf8.rawValue))
    }
    
    /// data 转 string
    public static func data2string(from data: Data) -> String? {
        
        return NSString(data: data, encoding: String.Encoding.utf8.rawValue) as String?
    }
    
    /// dict 转 string (json格式数据)
    public static func dict2string(from dict: [String: Any]) -> String? {
        
        guard JSONSerialization.isValidJSONObject(dict) else {
            return nil
        }
        guard let data = try? JSONSerialization.data(withJSONObject: dict, options: []) else {
            return nil
        }
        return NSString(data: data, encoding: String.Encoding.utf8.rawValue) as String?
    }

    /// string 转 dict (json格式数据)
    public static func string2dict(from string: String) -> [String: Any]? {
    
        let data: Data = string.data(using: .utf8)!
        let dict = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers)
        return dict as? [String: Any]
    }
    
    /// dict 转 data (json格式数据)
    public static func dict2data(from dict: [String: Any]) -> Data? {
        
        guard JSONSerialization.isValidJSONObject(dict) else {
            return nil
        }
        let data = try? JSONSerialization.data(withJSONObject: dict, options: [])
        return data
    }
    
    /// data 转 dict (json格式数据)
    public static func data2dict(from data: Data) -> [String: Any]? {
        
        let json = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers)
        guard let dict: Dictionary = json as? [String: Any] else {
            return nil
        }
        return dict
    }
    
    /// array 转 data (json格式数据)
    public static func array2data(from array: [Any]) -> Data? {
        
        guard JSONSerialization.isValidJSONObject(array) else {
            return nil
        }
        let data = try? JSONSerialization.data(withJSONObject: array, options: [])
        return data
    }
    
    /// data 转 array (json格式数据)
    public static func data2array(from data: Data) -> [Any]? {
        
        let json = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers)
        guard let array = json as? [Any] else {
           return nil
        }
        return array
    }
}
