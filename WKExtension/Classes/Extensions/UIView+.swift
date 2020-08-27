//
//  UIView+.swift
//  PeasantryAssistance
//
//  Created by 冰璐守恒 on 2019/6/14.
//  Copyright © 2019 zhuyifeng. All rights reserved.
//

import Foundation

extension UIView {
    
    public var x: CGFloat {
        get {
            return self.frame.origin.x
        }
        
        set(newValue) {
            var frame = self.frame
            frame.origin.x = newValue
            self.frame = frame
        }
    } // 获取x
    
    public var y: CGFloat {
        get {
            return self.frame.origin.y
        }
        
        set(newValue) {
            var frame = self.frame
            frame.origin.y = newValue
            self.frame = frame
        }
    } // 获取y
    
    public var width: CGFloat {
        get {
            return self.frame.size.width
        }
        
        set(newValue) {
            var frame = self.frame
            frame.size.width = newValue
            self.frame = frame
        }
    } // 获取width
    
    public var height: CGFloat {
        get {
            return self.frame.size.height
        }
        
        set(newValue) {
            var frame = self.frame
            frame.size.height = newValue
            self.frame = frame
        }
    } // 获取width
    
    public var centerX: CGFloat {
        get {
            return self.center.x
        }
        set(newValue) {
            var center = self.center
            center.x = newValue
            self.center = center
        }
    } // 获取中心点
    
    public var centerY: CGFloat {
        get {
            return self.center.y
        }
        set(newValue) {
            var center = self.center
            center.y = newValue
            self.center = center
        }
    } // 获取中心点
    
    public var maxX: CGFloat {
        get {
            return self.frame.maxX
        }
    }
    
    public var maxY: CGFloat {
        get {
            return self.frame.maxY
        }
    }
    
    // MARK: 获取当前控制器
    /// 获取当前控制器
    /// - Returns: 获取当前控制器
    public func getFirstViewController() -> UIViewController? {
        for view in sequence(first: self.superview, next: {$0?.superview}){
            if let responder = view?.next{
                if responder.isKind(of: UIViewController.self){
                    return responder as? UIViewController
                }
            }
        }
        return nil
    }
    
    // MARK: 设置view圆角
    /// 获取圆角
    /// - Parameter radius: 圆角尺寸
    public func toCorner(_ radius: CGFloat) -> Self {
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
        return self
    }
    
    // MARK: 设置圆角与边框
    /// 设置圆角与边框
    /// - Parameters:
    ///   - radius: 圆角尺寸
    ///   - borderColor: 边框颜色
    ///   - borderWidth: 边框宽度
    public func toCorner(_ radius: CGFloat, borderColor: UIColor, borderWidth: CGFloat ) -> Self {
        self.layer.borderColor = borderColor.cgColor
        self.layer.borderWidth = borderWidth
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = (radius != 0)
        return self
    }
    
    // MARK: 设置view圆角、虚线边框
    /// 设置view圆角、虚线边框
    /// - Parameters:
    ///   - radius: 圆角尺寸
    ///   - borderColor: 边框颜色
    ///   - dotBorderWidth: 边框宽度
    public func toCorner(_ radius: CGFloat, borderColor: UIColor, dotBorderWidth: CGFloat) -> Self {
        self.layer.masksToBounds = (radius != 0)
        let borderLayer = CAShapeLayer()
        borderLayer.bounds = CGRect(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height)
        borderLayer.strokeColor = borderColor.cgColor
        borderLayer.position = CGPoint(x: self.bounds.midX, y: self.bounds.midY)
        borderLayer.path = UIBezierPath(roundedRect: borderLayer.bounds, cornerRadius: radius).cgPath
        borderLayer.lineWidth = dotBorderWidth
        borderLayer.lineDashPattern = [2, 2]
        //实线边框// borderLayer.lineDashPattern = nil
        borderLayer.fillColor = UIColor.clear.cgColor
        self.layer.addSublayer(borderLayer)
        return self
    }
    
    // MARK: 设置view圆角、阴影
    /// 设置view圆角、阴影
    /// - Parameters:
    ///   - radius: 圆角尺寸
    ///   - shadowColor: 阴影色
    ///   - shadowOffset: 阴影偏移量（默认.zero 会向下偏移3个像素）
    ///   - shadowOpacity: 阴影透明度
    ///   - shadowRadius: 阴影圆角
    public func toCorner(_ radius: CGFloat, shadowColor: UIColor, shadowOffset: CGSize = .zero, shadowOpacity: Float = 1, shadowRadius: CGFloat) -> Self {
        self.layer.cornerRadius = radius
        self.layer.shadowColor = shadowColor.cgColor
        self.layer.shadowOffset = shadowOffset
        self.layer.shadowOpacity = shadowOpacity
        self.layer.shadowRadius = shadowRadius
        return self
    }
    
    // MARK: 添加底部边线
    /// 添加底部边线
    public func addLineAtBottom() -> Self {
        return self.addLineAtBottom(nil)
    }
    
    // MARK: 添加自定义底色底部边线
    /// 添加底部边线
    /// - Parameter color: 背景色
    public func addLineAtBottom(_ color: UIColor? = nil) -> Self {
        let frame = CGRect(x: 0, y: self.frame.size.height-1, width: self.frame.size.width, height: 1)
        return self.addLineLayer(frame, identifier: nil, color: color)
    }
    
    // MARK: 添加自定义底色底部边线
    public func addCellLineAtBottom(_ color: UIColor? = nil) -> Self {
        let frame = CGRect(x: 15, y: self.frame.size.height-1, width: self.frame.size.width - 30, height: 1)
        return self.addLineLayer(frame, identifier: nil, color: color)
    }
    
    // MARK: 添加线框
    public func addLineLayer(_ frame: CGRect, identifier: String? = nil, color: UIColor? = nil) -> Self {
        let lineLayer = CALayer()
        lineLayer.frame = frame
        lineLayer.name = identifier
        if color != nil {
            lineLayer.backgroundColor = color?.cgColor
        }else {
            lineLayer.backgroundColor = UIColor(red: 239, green: 239, blue: 239).cgColor
        }
        self.layer.addSublayer(lineLayer)
        return self
    }
    
    // MARK: 截图
    public func screenShot() -> UIImage {
        UIGraphicsBeginImageContextWithOptions(self.bounds.size, false, 0.0)
        self.layer.render(in: UIGraphicsGetCurrentContext()!)
        let screenShotImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return screenShotImage!
    }
}
