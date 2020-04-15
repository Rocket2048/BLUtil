//
//  UIControl+BLExt.swift
//  BLUtil_Example
//
//  Created by lin bo on 2020/4/15.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit

private struct RunTimeControlKey {

    ///连续两次点击相差时间
    static let timeInterval = UnsafeRawPointer.init(bitPattern: "timeInterval".hashValue)
}

extension UIControl {
    
    /// 两次点击响应间隔时间
    public var timeInterval: CGFloat? {
        set {
            objc_setAssociatedObject(self, RunTimeControlKey.timeInterval!, newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC)
            UIControl.changeFunction
        }
        get {
            return  objc_getAssociatedObject(self, RunTimeControlKey.timeInterval!) as? CGFloat
        }
    }
    
    private static let changeFunction: () = {
        
        //交换方法
        let systemMethod = class_getInstanceMethod(UIButton.classForCoder(), #selector(UIControl.sendAction(_:to:for:)))
        let swizzMethod = class_getInstanceMethod(UIButton.classForCoder(), #selector(UIControl.mySendAction(_:to:for:)))
        method_exchangeImplementations(systemMethod!, swizzMethod!)
    }()
    
    @objc private dynamic func mySendAction(_ action: Selector, to target: Any?, for event: UIEvent?) {
        
        self.isUserInteractionEnabled = false
        let time: TimeInterval = TimeInterval(timeInterval ?? 0.0)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + time) {
            self.isUserInteractionEnabled = true
        }
        mySendAction(action, to: target, for: event)
    }
}
