//
//  BLValue.swift
//  BLUtil
//
//  Created by lin bo on 2019/3/19.
//  Copyright © 2018-2028 lin bo. All rights reserved.
//

import Foundation

open class BLValue: NSObject {

    /// 把字符串转变为data
    public static func data(from jsonString:String) -> Data? {
        
        return jsonString.data(using: String.Encoding(rawValue: String.Encoding.utf8.rawValue))
    }
    
    /// data 转 字符串
    public static func jsonString(from data:Data) -> String? {
        
        return NSString(data: data, encoding: String.Encoding.utf8.rawValue) as String?
    }
    
    /// 字典转换为JSONString
    public static func jsonString(from dictionary:Dictionary<String, Any>) -> String? {
        
        if (!JSONSerialization.isValidJSONObject(dictionary)) {
            print("无法解析出JSONString")
            return ""
        }
        
        guard let data = try? JSONSerialization.data(withJSONObject: dictionary, options: []) else {
            return nil
        }
        
        return NSString(data:data ,encoding: String.Encoding.utf8.rawValue) as String?
    }
    
    /// JSONString转换为字典
    public static func dictionary(from jsonString:String) -> Dictionary<String, Any>? {
        
        let jsonData:Data = jsonString.data(using: .utf8)!
        let dict = try? JSONSerialization.jsonObject(with: jsonData, options: .mutableContainers)
        
        return dict as? Dictionary<String, Any>
    }
    
    /// 字典转二进制
    public static func data(from jsonDic:Dictionary<String, Any>) -> Data? {
        
        if (!JSONSerialization.isValidJSONObject(jsonDic)) {
            print("字典转二进制失败")
            return Data()
        }
        let data = try? JSONSerialization.data(withJSONObject: jsonDic, options: [])
        
        return data
    }
    
    /// 二进制转字典
    public static func dictionary(from data:Data) -> Dictionary<String, Any>? {
        
        let json = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers)
        if let dic: Dictionary = json as? Dictionary<String, Any> {
            return dic
        }
        return nil
    }
    
    /// 数组转data
    public static func data(from array:Array<Any>) -> Data? {
        
        if (!JSONSerialization.isValidJSONObject(array)) {
            print("数组转data")
            return Data()
        }
        let data = try? JSONSerialization.data(withJSONObject: array, options: [])
        return data
    }
    
    /// data转数组
    public static func array(from data:Data) -> Array<Any>? {
        
        let json = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers)
        if let array:Array = json as? Array<Any> {
            return array
        }
        return nil
    }
    
}
