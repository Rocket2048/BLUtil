//
//  BLUtil.swift
//  BLUtil
//
//  Created by lin bo on 2019/3/19.
//  Copyright © 2018-2028 lin bo. All rights reserved.
//

import Foundation
import CommonCrypto
import UIKit

public class BLUtil {
    
    /// String MD5 返回32位
    public static func md5(_ str:String) -> String {
        
        let cStr = str.cString(using: String.Encoding.utf8);
        let buffer = UnsafeMutablePointer<UInt8>.allocate(capacity: 16)
        CC_MD5(cStr!,(CC_LONG)(strlen(cStr!)), buffer)
        
        let md5String = NSMutableString()
        for i in 0 ..< 16{
            md5String.appendFormat("%02x", buffer[i])
        }
        free(buffer)
        
        return md5String as String
    }
    
    /// Data MD5 返回32位
    public static func md5(_ data:Data) -> String {
        
        var digest = [UInt8](repeating: 0, count: Int(CC_MD5_DIGEST_LENGTH))
        _ = data.withUnsafeBytes { (bytes) in
            CC_MD5(bytes, CC_LONG(data.count), &digest)
        }
        var digestHex = ""
        for index in 0 ..< Int(CC_MD5_DIGEST_LENGTH) {
            digestHex += String(format: "%02x", digest[index])
        }
        
        return digestHex
    }
    
    /// 是否非iphoneX系列
    public static func judgeiPhoneX() -> Bool {
        
        let type = BLUtil.iphoneType()
        
        if type == "iPhone Simulator" {
            if UIScreen.main.bounds.size.width == 812.0 || UIScreen.main.bounds.size.height == 896.0 {
                return true
            }
        } else if type.hasPrefix("iPhone X") {
            return true
        }
        return false
    }
    
    /// 手机型号
    public static func iphoneType() ->String {
        
        var systemInfo = utsname()
        uname(&systemInfo)
        
        let platform = String(cString: &systemInfo.machine.0, encoding: String.Encoding.ascii)
        var type = ""
        
        switch platform {
            
        case "iPhone1,1": type = "iPhone 2G"
        case "iPhone1,2": type = "iPhone 3G"
        case "iPhone2,1": type = "iPhone 3GS"
        case "iPhone3,1": type = "iPhone 4"
        case "iPhone3,2": type = "iPhone 4"
        case "iPhone3,3": type = "iPhone 4"
        case "iPhone4,1": type = "iPhone 4S"
        case "iPhone5,1": type = "iPhone 5"
        case "iPhone5,2": type = "iPhone 5"
        case "iPhone5,3": type = "iPhone 5C"
        case "iPhone5,4": type = "iPhone 5C"
        case "iPhone6,1": type = "iPhone 5S"
        case "iPhone6,2": type = "iPhone 5S"
        case "iPhone7,1": type = "iPhone 6 Plus"
        case "iPhone7,2": type = "iPhone 6"
        case "iPhone8,1": type = "iPhone 6S"
        case "iPhone8,2": type = "iPhone 6S Plus"
        case "iPhone8,4": type = "iPhone SE"
        case "iPhone9,1": type = "iPhone 7"
        case "iPhone9,2": type = "iPhone 7 Plus"
        case "iPhone9,4": type = "iPhone 7 Plus"
        case "iPhone10,1": type = "iPhone 8"
        case "iPhone10,4": type = "iPhone 8"
        case "iPhone10,2": type = "iPhone 8 Plus"
        case "iPhone10,5": type = "iPhone 8 Plus"
        case "iPhone10,3": type = "iPhone X"
        case "iPhone10,6": type = "iPhone X"
        case "iPhone11,2": type = "iPhone XS"
        case "iPhone11,4": type = "iPhone XS Max"
        case "iPhone11,6": type = "iPhone XS Max"
        case "iPhone11,8": type = "iPhone XR"

        case "iPod1,1": type = "iPod Touch 1G"
        case "iPod2,1": type = "iPod Touch 2G"
        case "iPod3,1": type = "iPod Touch 3G"
        case "iPod4,1": type = "iPod Touch 4G"
        case "iPod5,1": type = "iPod Touch 5G"
        case "iPad1,1": type = "iPad 1G"
        case "iPad2,1": type = "iPad 2"
        case "iPad2,2": type = "iPad 2"
        case "iPad2,3": type = "iPad 2"
        case "iPad2,4": type = "iPad 2"
        case "iPad2,5": type = "iPad Mini 1G"
        case "iPad2,6": type = "iPad Mini 1G"
        case "iPad2,7": type = "iPad Mini 1G"
        case "iPad3,1": type = "iPad 3"
        case "iPad3,2": type = "iPad 3"
        case "iPad3,3": type = "iPad 3"
        case "iPad3,4": type = "iPad 4"
        case "iPad3,5": type = "iPad 4"
        case "iPad3,6": type = "iPad 4"
        case "iPad4,1": type = "iPad Air"
        case "iPad4,2": type = "iPad Air"
        case "iPad4,3": type = "iPad Air"
        case "iPad4,4": type = "iPad Mini 2G"
        case "iPad4,5": type = "iPad Mini 2G"
        case "iPad4,6": type = "iPad Mini 2G"
        case "iPad4,7": type = "iPad Mini 3"
        case "iPad4,8": type = "iPad Mini 3"
        case "iPad4,9": type = "iPad Mini 3"
        case "iPad5,1": type = "iPad Mini 4"
        case "iPad5,2": type = "iPad Mini 4"
        case "iPad5,3": type = "iPad Air 2"
        case "iPad5,4": type = "iPad Air 2"
        case "iPad6,3": type = "iPad Pro 9.7"
        case "iPad6,4": type = "iPad Pro 9.7"
        case "iPad6,7": type = "iPad Pro 12.9"
        case "iPad6,8": type = "iPad Pro 12.9"
            
        case "i386": type = "iPhone Simulator"
        case "x86_64": type = "iPhone Simulator"
            
        default: type = "Unkonw"
        }
        
        return type
    }
}



