//
//  UITableViewCell.swift
//  SmartCloud
//
//  Created by 冰璐守恒 on 16/5/16.
//  Copyright © 2016年 SmartPower. All rights reserved.
//
import UIKit
extension UITableViewCell {
    
    public func removeSeperatorLeftInset() {
        if self.responds(to: #selector(setter: UITableViewCell.separatorInset)) {
            self.separatorInset = UIEdgeInsets.zero
        }
        if #available(iOS 8.0, *) {
            self.layoutMargins = UIEdgeInsets.zero
        }
        if #available(iOS 8.0, *) {
            self.preservesSuperviewLayoutMargins = false
        }
    }
    
    public func removeAllSeperator() {
        if self.responds(to: #selector(setter: UITableViewCell.separatorInset)) {
            self.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: self.frame.width)
        }
        if #available(iOS 8.0, *) {
            self.layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: self.frame.width)
            self.preservesSuperviewLayoutMargins = false
        }
    }
    
    public func restoreSeperatorLeftInset() {
        if self.responds(to: #selector(setter: UITableViewCell.separatorInset)) {
            self.separatorInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 0)
        }
        if #available(iOS 8.0, *) {
            self.layoutMargins = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 0)
            self.preservesSuperviewLayoutMargins = false
        }
    }
  
    func setSeperatorLeftInset(_ inset: CGFloat) {
        if self.responds(to: #selector(setter: UITableViewCell.separatorInset)) {
            self.separatorInset = UIEdgeInsets(top: 0, left: inset, bottom: 0, right: 0)
        }
        if #available(iOS 8.0, *) {
            self.layoutMargins = UIEdgeInsets(top: 0, left: inset, bottom: 0, right: 0)
            self.preservesSuperviewLayoutMargins = false
        }
    }
    
    func setSeperatorLeftAndRightInset(_ inset: CGFloat ,right: CGFloat) {
        if self.responds(to: #selector(setter: UITableViewCell.separatorInset)) {
            self.separatorInset = UIEdgeInsets(top: 0, left: inset, bottom: 0, right: right)
        }
        if #available(iOS 8.0, *) {
            self.layoutMargins = UIEdgeInsets(top: 0, left: inset, bottom: 0, right: right)
            self.preservesSuperviewLayoutMargins = false
        }
    }
    
    func stringWithHighLightSubstring(_ totalString: String, substring: String, fontSize: Float) -> NSMutableAttributedString {
        let attributedString = NSMutableAttributedString(string: totalString)
        var copyTotalString = totalString
        var replaceString = ""
        for _ in 0..<substring.count {
            replaceString += " "
        }
        // 设置行间距
        while copyTotalString.range(of: substring) != nil && ("".nsRange(from: copyTotalString.range(of: substring)!)).location != NSNotFound {
            let newRange = copyTotalString.range(of: substring)
            let attr: [NSAttributedString.Key : Any] = [.font: UIFont(name: "PingFangSC-Medium", size: CGFloat(fontSize)) as Any,.foregroundColor: UIColor(red: 0.26, green: 0.47, blue: 0.81,alpha:1)]
            attributedString.addAttributes(attr, range: "".nsRange(from: newRange!))
            copyTotalString = copyTotalString.replacingCharacters(in: newRange!, with: replaceString)
        }
        let style = NSMutableParagraphStyle()
        style.lineSpacing = 5
        attributedString.addAttributes([NSAttributedString.Key.paragraphStyle: style], range: NSMakeRange(0, totalString.count))
        return attributedString
    }
}
