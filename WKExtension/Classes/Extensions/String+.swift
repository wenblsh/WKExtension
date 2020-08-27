//
//  String+.swift
//  PeasantryAssistance
//
//  Created by 冰璐守恒 on 2019/5/31.
//  Copyright © 2019 zhuyifeng. All rights reserved.
//

import UIKit

extension String {
    public func removeSpaces()-> String {
        return self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }
    
    public func placeholder()->String {
        if self == "<null>" || self.count <= 0 {
            return "-"
        }
        return self
    }
    
    public func orNoData(_ tip:String?=nil)->String {
        if self == "<null>" || self.count <= 0 {
            if tip != nil {
                return "暂无" + tip!
            }else {
                return "暂无"
            }
        }
        return self
    }
    
    public func toArray(_ sep: String=",") -> [String] {
        if self.count == 0 {
            return []
        }
        let array = self.components(separatedBy: sep)
        return array
    }
    
    public func getKeyVauleFromURLString() -> [String: String] {
        var dictionary = [String: String]()
        let array = self.components(separatedBy: "?")
        if let second = array.last {
            let array2 = second.components(separatedBy: "&")
            for item in array2 {
                let array3 = item.components(separatedBy: "=")
                if let key = array3.first, let value = array3.last {
                    dictionary[key] = value
                }
            }
        }
        return dictionary
    }
    
    public func isIntType() -> Bool {
        let regex = "^[0-9]*$"
        let resultStr = NSPredicate(format: "SELF MATCHES %@",regex)
        return resultStr.evaluate(with: self)
    }
    
    public func isFloatType() -> Bool {
        let regex = "^[0-9]+([.]{0}|[.]{1}[0-9]+)$"
        let resultStr = NSPredicate(format: "SELF MATCHES %@",regex)
        return resultStr.evaluate(with: self)
    }
    
    public func toDouble() -> Double {
        if let value = Double(self) {
            return value
        }
        return 0.00
    }
    
    public func toIntArray() -> [Int] {
        let value = self.toArray(".")
        var ints = [Int]()
        for item in value {
            if let int = Int(item) {
                ints.append(int)
            }
        }
        return ints
    }
    
    // MARK: 计算字体宽度
    public func sizeWithFont(_ font: UIFont, maxSize: CGSize) -> CGSize {
        let attrs = [NSAttributedString.Key.font: font]
        let bounds = NSString(string: self).boundingRect(with: maxSize, options: .usesLineFragmentOrigin, attributes: attrs, context: nil)
        return bounds.size
    }
     
    /// range转换为NSRange
    public func nsRange(from range: Range<String.Index>) -> NSRange {
        return NSRange(range, in: self)
    }
    
    /// NSRange转化为range
    public func range(from nsRange: NSRange) -> Range<String.Index>? {
        guard
            let from16 = utf16.index(utf16.startIndex, offsetBy: nsRange.location, limitedBy: utf16.endIndex),
            let to16 = utf16.index(from16, offsetBy: nsRange.length, limitedBy: utf16.endIndex),
            let from = String.Index(from16, within: self),
            let to = String.Index(to16, within: self)
            else { return nil }
          return from ..< to
    }
    
    /// 处理为URL可允许
    public func tranUrlAllowed() -> String {
        var charSet = CharacterSet.urlQueryAllowed
        charSet.insert(charactersIn: "!$&'()*+,-./:;=?@_~%#[]")
        return self.addingPercentEncoding(withAllowedCharacters: charSet)!
    }
}
