//
//  UILabel+.swift
//  PeasantryAssistance
//
//  Created by 冰璐守恒 on 2020/3/2.
//  Copyright © 2020 blsh. All rights reserved.
//

import UIKit

extension UILabel {

    fileprivate func getAttributeStringWithString(_ string: String,lineSpace:CGFloat
    ) -> NSAttributedString{
        let attributedString = NSMutableAttributedString(string: string)
        let paragraphStye = NSMutableParagraphStyle()
        //调整行间距
        paragraphStye.lineSpacing = lineSpace
        let rang = NSMakeRange(0, CFStringGetLength(string as CFString?))
        attributedString .addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStye, range: rang)
        return attributedString
    }
    
    // 根据文字计算label高度
    public func autoLabel(lineHeight:CGFloat){
        self.numberOfLines=0
        self.lineBreakMode = NSLineBreakMode.byWordWrapping
        let text:String = self.text!//获取label的text
        self.attributedText = self.getAttributeStringWithString(text, lineSpace: lineHeight)
        let fontSize = CGSize(width: self.frame.width, height: self.font.lineHeight)
        let rect:CGSize = text.boundingRect(with: fontSize, options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: self.font ?? 15], context: nil).size;
        self.frame = CGRect(x:self.frame.origin.x,y:self.frame.origin.y,width: rect.width, height: rect.height)
        self.sizeToFit()
    }

}
