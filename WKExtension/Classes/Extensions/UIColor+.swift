//
//  UIColor+.swift
//  PeasantryAssistance
//
//  Created by 冰璐守恒 on 2019/5/31.
//  Copyright © 2019 zhuyifeng. All rights reserved.
//

import UIKit

extension UIColor {
    
    /// 获取随机色
    static public var random: UIColor {
        return UIColor(red: Int(UInt8(arc4random_uniform(256))), green: Int(UInt8(arc4random_uniform(256))), blue: Int(UInt8(arc4random_uniform(256))))
    }
    
    /// RGBA快速初始化颜色
    convenience public init(red: Int, green: Int, blue: Int, alpha: CGFloat = 1.0) {
        self.init(red: CGFloat(red)/255.0,
                  green: CGFloat(green)/255.0,
                  blue: CGFloat(blue)/255.0,
                  alpha: alpha)
    }
    /// hexColor 快速初始化颜色
    convenience public init(hex: UInt, alpha: CGFloat = 1.0) {
        self.init(red: CGFloat((hex & 0xFF0000) >> 16) / 255.0,
                  green: CGFloat((hex & 0x00FF00) >> 8) / 255.0,
                  blue: CGFloat(hex & 0x0000FF) / 255.0,
                  alpha: alpha)
    }
    
    /// 颜色生成图片
    public func image(_ width: CGFloat=1, height: CGFloat=1) -> UIImage {
        let rect = CGRect(x: 0, y: 0, width: width, height: height)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(self.cgColor)
        context?.fill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
}
