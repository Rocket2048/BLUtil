//
//  BLLabel.swift
//  BLUtil
//
//  Created by lin bo on 2019/3/19.
//  Copyright © 2018-2028 lin bo. All rights reserved.
//

import UIKit

open class BLLabel: UILabel {
    
    /// 字间距
    open var WordSpace: CGFloat = 0.0
    /// 行间距
    open var LineSpace: CGFloat = 0.0
    
    /// 是否让文本居左上
    open var topText: Bool = false {
        
        didSet{
            if topText == true {
                self.setNeedsDisplay()
            }
        }
    }
  
    /// 重写方法
    override open var text: String?{
        
        didSet{
            self.setNeedsDisplay()
            /// 改变 行间距 和 字间距
            let labelText = self.text ?? ""
            let attStr = NSMutableAttributedString.init(string: labelText)
            let paragraphStyle:NSMutableParagraphStyle = NSMutableParagraphStyle.init()
            paragraphStyle.lineSpacing = LineSpace
            attStr.addAttribute(NSAttributedStringKey.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, labelText.count))
            attStr.addAttribute(NSAttributedStringKey.kern, value: WordSpace, range: NSMakeRange(0, labelText.count))
            self.attributedText = attStr
        }
    }
    
    /// 重写方法
    override open func drawText(in rect: CGRect) {
        
        if self.text?.isEmpty == true{
            return
        }
        /// 绘制文本
        let size = CGSize(width:CGFloat(self.W), height:CGFloat.greatestFiniteMagnitude)
        let MYRect = self.text!.boundingRect(with: size, options:.usesLineFragmentOrigin, attributes: [NSAttributedStringKey.font : font], context:nil)
        let Height = MYRect.size.height
        let tempRect = CGRect.init(x: 0, y: 0, width: self.W, height: Height)
        
        if topText == true {
            super.drawText(in: tempRect)
        }else{
            super.drawText(in: rect)
        }
    }
}
