
//
//  UIButton+BLExt.swift
//  BLUtil
//
//  Created by lin bo on 2019/3/19.
//  Copyright © 2018-2028 lin bo. All rights reserved.
//

import UIKit

extension UIButton {
    
    /// 设置文字颜色颜色和选中状态颜色
    ///
    /// - Parameters:
    ///   - normolColor: normolColor
    ///   - selectColor: selectColor
    public func setTitleColor(normolColor: UIColor, selectColor: UIColor) {
        
        self.setTitleColor(normolColor, for: .normal)
        self.setTitleColor(selectColor, for: .selected)
    }
    
    /// 设置选择状态和未选中状态的image
    ///
    /// - Parameters:
    ///   - normolImge: normolImge
    ///   - selectImage: selectImage
    public func setImage(normolImge: UIImage, selectImage: UIImage) {
        
        self.setImage(normolImge, for: .normal)
        self.setImage(selectImage, for: .selected)
    }
    
    /// 设置未选择状态的title和color
    ///
    /// - Parameters:
    ///   - title: title
    ///   - titleColor: color
    public func setTitleWithTitleColor(title: String, titleColor: UIColor) {
        
        self.setTitle(title, for: .normal)
        self.setTitleColor(titleColor, for: .normal)
    }
    
    /// 设置title&image
    ///
    /// - Parameters:
    ///   - title: title
    ///   - image: image
    public func setTitleWithImage(title: String, image: UIImage) {
        setImage(image, for: .normal)
        setTitle(title, for: .normal)
    }
}

private struct RunTimeButtonKey {
    ///点击区域
    static let topNameKey = UnsafeRawPointer.init(bitPattern: "topNameKey".hashValue)
    static let rightNameKey = UnsafeRawPointer.init(bitPattern: "rightNameKey".hashValue)
    static let bottomNameKey = UnsafeRawPointer.init(bitPattern: "bottomNameKey".hashValue)
    static let leftNameKey = UnsafeRawPointer.init(bitPattern: "leftNameKey".hashValue)
}

extension UIButton {
    
    //=== 扩大点击响应事件 ===
    fileprivate var topEdge: CGFloat? {
        set {
            objc_setAssociatedObject(self, RunTimeButtonKey.topNameKey!, newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        }
        get {
            return  objc_getAssociatedObject(self, RunTimeButtonKey.topNameKey!) as? CGFloat
        }
    }
    
    fileprivate var leftEdge: CGFloat? {
        set {
            objc_setAssociatedObject(self, RunTimeButtonKey.leftNameKey!, newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        }
        get {
            return  objc_getAssociatedObject(self, RunTimeButtonKey.leftNameKey!) as? CGFloat
        }
    }
    
    fileprivate var rightEdge: CGFloat? {
        set {
            objc_setAssociatedObject(self, RunTimeButtonKey.rightNameKey!, newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        }
        get {
            return  objc_getAssociatedObject(self, RunTimeButtonKey.rightNameKey!) as? CGFloat
        }
    }
    
    fileprivate var bottomEdge: CGFloat? {
        set {
            objc_setAssociatedObject(self, RunTimeButtonKey.bottomNameKey!, newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        }
        get {
            return  objc_getAssociatedObject(self, RunTimeButtonKey.bottomNameKey!) as? CGFloat
        }
    }
    
    /// 扩大点击区域
    ///
    /// - Parameters:
    ///   - top: 上
    ///   - right: 右
    ///   - bottom: 下
    ///   - left: 左
    public func setEnlargeEdge(top: CGFloat, right: CGFloat, bottom: CGFloat, left: CGFloat) {
        
        self.topEdge = top
        self.rightEdge = right
        self.bottomEdge = bottom
        self.leftEdge = left
    }
    
    /// 方法重写
    open override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        
        let left = self.leftEdge ?? 0
        let right = self.rightEdge ?? 0
        let bottom = self.bottomEdge ?? 0
        let top = self.topEdge ?? 0
        
        var rect: CGRect
        if left > 0 || right > 0 || bottom > 0 || top > 0 {
            rect = CGRect(x: self.bounds.origin.x - left,
                                     y: self.bounds.origin.y - top,
                                     width: self.bounds.size.width + left + right, height: self.bounds.size.height + top + bottom)
        } else {
            rect = self.bounds
        }
        
        if rect.contains(self.bounds) {
            return super.hitTest(point, with: event)
        }
        return rect.contains(point) ? self : nil
    }
}

extension UIButton {
    
    /// 整体在中间 image在左 title在右
    ///
    /// - Parameters:
    ///   - imageWidth: imageWidth
    ///   - space: image和Button的间距
    public func setImageFrontTextWithCenterAlignment( imageWidth: CGFloat, space: CGFloat) {
        
        let image = UIImage.scaleTo(image: self.imageView!.image!, w: imageWidth, h: imageWidth)
        setImage(image, for: .normal)
        
        let insetAmount = space / 2
        imageEdgeInsets = UIEdgeInsets(top: 0, left: -insetAmount, bottom: 0, right: insetAmount)
        titleEdgeInsets = UIEdgeInsets(top: 0, left: insetAmount, bottom: 0, right: -insetAmount)
        contentEdgeInsets = UIEdgeInsets(top: 0, left: insetAmount, bottom: 0, right: insetAmount)
    }
   
    /// 整体在最左侧   image在左 title在右
    ///
    /// - Parameters:
    ///   - imageWidth: imageWidth
    ///   - space: space
    ///   - buttonWidth: buttonWidth
    public func setImageFrontTextWithLeftAlignment(imageWidth: CGFloat, space: CGFloat, buttonWidth: CGFloat) {
        
        let image = UIImage.scaleTo(image: self.imageView!.image!, w: imageWidth, h: imageWidth)
        setImage(image, for: .normal)
        
        //布局界面
        let titleLabelWidth = self.titleLabel?.text?.obtainTextWidth(font: (self.titleLabel?.font)!) ?? 0
        //左右两边的空隙
        let spaceW = (buttonWidth - titleLabelWidth - imageWidth)/2
        imageEdgeInsets = UIEdgeInsets(top: 0, left: -spaceW+space, bottom: 0, right: spaceW-space)
        titleEdgeInsets = UIEdgeInsets(top: 0, left: -spaceW+2*space, bottom: 0, right: spaceW-space)
    }
    
    /// 上下结构 image在上 label在下
    ///
    /// - Parameters:
    ///   - imageWidth: imageWidth
    ///   - space: space
    public func setImageFrontTextWithTopAlignment(imageWidth: CGFloat, space: CGFloat) {
        
        let image = UIImage.scaleTo(image: self.imageView!.image!, w: imageWidth, h: imageWidth)
        setImage(image, for: .normal)
        
        //布局界面
        let titleLabelWidth = self.titleLabel?.text?.obtainTextWidth(font: (self.titleLabel?.font)!) ?? 0
        let labelHeight = CGFloat((self.titleLabel?.font.pointSize)!)

        imageEdgeInsets = UIEdgeInsets(top: -labelHeight-space/2, left: 0, bottom: 0, right: -titleLabelWidth)
        titleEdgeInsets = UIEdgeInsets(top: 0, left: -imageWidth, bottom: -imageWidth-space/2, right: 0)
    }
}
