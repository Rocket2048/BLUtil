//
//  BLLabel.swift
//  BLUtil
//
//  Created by lin bo on 2019/3/19.
//  Copyright © 2018-2028 lin bo. All rights reserved.
//

import UIKit

open class JYLabel: UILabel {
    
    ///字间距
    public var WordSpace: CGFloat = 0.0
    ///行间距
    public var LineSpace: CGFloat = 0.0
    
    /// 是否让文本居左上
    var topText: Bool = false {
        
        didSet {
            if topText == true {
                self.setNeedsDisplay()
            }
        }
    }
  
    /// 重写方法
    override open var text: String? {
        
        didSet {
            self.setNeedsDisplay()
            /// 改变 行间距 和 字间距
            let labelText = self.text ?? ""
            let attStr = NSMutableAttributedString.init(string: labelText)
            let paragraphStyle: NSMutableParagraphStyle = NSMutableParagraphStyle.init()
            paragraphStyle.lineSpacing = LineSpace
            attStr.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSRange(location: 0, length: labelText.count))
            attStr.addAttribute(NSAttributedString.Key.kern, value: WordSpace, range: NSRange(location: 0, length: labelText.count))
            self.attributedText = attStr
        }
    }
    
    /// 重写方法
    override open func drawText(in rect: CGRect) {
        
        if self.text?.isEmpty == true {
            return
        }
        /// 绘制文本
        let size = CGSize(width: CGFloat(self.W), height: CGFloat.greatestFiniteMagnitude)
        let MYRect = self.text!.boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font!], context: nil)
        let Height = MYRect.size.height
        let tempRect = CGRect.init(x: 0, y: 0, width: self.W, height: Height)
        
        if topText == true {
            super.drawText(in: tempRect)
        } else {
            super.drawText(in: rect)
        }
    }
}
