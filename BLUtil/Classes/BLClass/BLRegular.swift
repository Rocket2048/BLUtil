//
//  JHRegularHelp.swift
//  BLUtil
//
//  Created by lin bo on 2019/3/19.
//  Copyright © 2018-2028 lin bo. All rights reserved.
//

import UIKit

class JYRegular {
    
    fileprivate enum ValidatedType {
        case Email
        case PhoneNumber
        case Number
        case SpecificNumbers
        case Chinese
        case IllegalCharacter
        case URL
        case BlankLines
        case QQ
        case ID
        case MAC
        case IdCard
        case DateInformation
        case AccountLegal
        case Password
        case StrongPassword
        case ThereIsNo
    }
    
    fileprivate static func ValidateText(validatedType type: ValidatedType, validateString: String) -> Bool {
        
        var pattern = ""
        
        switch type {
            
        case ValidatedType.Email:
            pattern = "^([a-z0-9_\\.-]+)@([\\da-z\\.-]+)\\.([a-z\\.]{2,6})$"
            
        case ValidatedType.PhoneNumber:
            pattern = "^1[0-9]{10}$"
            
        case ValidatedType.Number:
            pattern = "^[0-9]*$"
            
        case ValidatedType.SpecificNumbers:
            pattern = "^\\d{8}$"
            
        case ValidatedType.Chinese:
            pattern = "^[\\u4e00-\\u9fa5]{0,}$"
            
        case ValidatedType.IllegalCharacter:
            pattern = "[%&',;=?$\\\\^]+"
            
        case ValidatedType.URL:
            pattern = "^http://([\\w-]+\\.)+[\\w-]+(/[\\w-./?%&=]*)?$"
            
        case ValidatedType.BlankLines:
            pattern = "^s*|s*$"
            
        case ValidatedType.QQ:
            pattern = "[1-9][0-9]{4,}"
            
        case ValidatedType.ID:
            pattern = "([1-9]{1,3}\\.){3}[1-9]"
            
        case ValidatedType.MAC:
            pattern = "([A-Fa-f0-9]{2}\\:){5}[A-Fa-f0-9]"
            
        case ValidatedType.IdCard:
            pattern = "\\d{14}[[0-9],0-9xX]"
            
        case ValidatedType.DateInformation:
            pattern = "^\\d{4}-\\d{1,2}-\\d{1,2}"
            
        case ValidatedType.AccountLegal:
            pattern = "[a-zA-Z0-9]{4,16}$"
            
        case ValidatedType.Password:
            pattern = "[a-zA-Z0-9@#%&*$^]{4,16}$"
            
        case ValidatedType.StrongPassword:
            pattern = "^(?=.*\\d)(?=.*[a-z])(?=.*[A-Z]).{6,16}$"
            
        default:
            break
        }

        let predicate = NSPredicate(format: "SELF MATCHES %@", pattern)
        return predicate.evaluate(with: validateString)
    }
    
    /// 验证邮箱
    public static func EmailIsValidated(_ vStr: String) -> Bool {
        
        return JYRegular.ValidateText(validatedType: ValidatedType.Email, validateString: vStr)
    }
    
    /// 验证手机号
    public static func PhoneNumberIsValidated(_ vStr: String) -> Bool {
        
        return JYRegular.ValidateText(validatedType: ValidatedType.PhoneNumber, validateString: vStr)
    }
    
    /// 验证数字
    public static func NumberIsValidated(_ vStr: String) -> Bool {
        
        return JYRegular.ValidateText(validatedType: ValidatedType.Number, validateString: vStr)
    }
    
    /// 验证8数字 里面的8换成你想要的数字
    public static func SpecificNumbersIsValidated(_ vStr: String) -> Bool {
        
        return JYRegular.ValidateText(validatedType: ValidatedType.SpecificNumbers, validateString: vStr)
    }
    
    /// 验证是否是中文
    public static func ChineseIsValidated(_ vStr: String) -> Bool {
        
        return JYRegular.ValidateText(validatedType: ValidatedType.Chinese, validateString: vStr)
    }
    
    /// 验证是否含有^%&',;=?$\"等字符
    public static func IllegalCharacterIsValidated(_ vStr: String) -> Bool {
        
        return JYRegular.ValidateText(validatedType: ValidatedType.IllegalCharacter, validateString: vStr)
    }
    
    /// 验证URL
    public static func URLIsValidated(_ vStr: String) -> Bool {
        
        return JYRegular.ValidateText(validatedType: ValidatedType.URL, validateString: vStr)
    }
    
    /// 验证首尾空白行 这个现在有问题
    public static func BlankLinesIsValidated(_ vStr: String) -> Bool {
        
        return JYRegular.ValidateText(validatedType: ValidatedType.BlankLines, validateString: vStr)
    }
    
    /// 验证QQ号
    public static func QQIsValidated(_ vStr: String) -> Bool {
        
        return JYRegular.ValidateText(validatedType: ValidatedType.QQ, validateString: vStr)
    }
    
    /// 验证ID地址 需要自定义
    public static func IDIsValidated(_ vStr: String) -> Bool {
        
        return JYRegular.ValidateText(validatedType: ValidatedType.ID, validateString: vStr)
    }
    
    /// 验证MAC地址
    public static func MACIsValidated(_ vStr: String) -> Bool {
        
        return JYRegular.ValidateText(validatedType: ValidatedType.MAC, validateString: vStr)
    }
    
    /// 验证身份证
    public static func IdCardIsValidated(_ vStr: String) -> Bool {
        
        return JYRegular.ValidateText(validatedType: ValidatedType.IdCard, validateString: vStr)
    }
    
    /// 验证年月日    例子 2013-04-12
    public static func DateInformationIsValidated(_ vStr: String) -> Bool {
        
        return JYRegular.ValidateText(validatedType: ValidatedType.DateInformation, validateString: vStr)
    }
    
    /// 验证帐号是否合法(字母开头，允许4-16字节，允许字母数字)
    public static func AccountLegalIsValidated(_ vStr: String) -> Bool {
        
        return JYRegular.ValidateText(validatedType: ValidatedType.AccountLegal, validateString: vStr)
    }
    
    /// 验证密码(以字母开头，长度在4~16之间，只能包含字母、数字)
    public static func PasswordIsValidated(_ vStr: String) -> Bool {
        
        return JYRegular.ValidateText(validatedType: ValidatedType.Password, validateString: vStr)
    }
    
    /// 验证强密码(必须包含大小写字母和数字的组合，不能使用特殊字符，长度在6-16之间)
    public static func StrongPasswordIsValidated(_ vStr: String) -> Bool {
        
        return JYRegular.ValidateText(validatedType: ValidatedType.StrongPassword, validateString: vStr)
    }
}
