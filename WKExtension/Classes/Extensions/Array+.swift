//
//  Array+.swift
//  PeasantryAssistance
//
//  Created by 冰璐守恒 on 2019/7/4.
//  Copyright © 2019 zhuyifeng. All rights reserved.
//

import Foundation

extension Array {
    public func toCopy<T>() -> [T] {
        let array = NSMutableArray(array: self)
        if array.count < 0 {
            return [T]()
        }
        let swiftArray = array as! [T]
        return swiftArray
    }
    
    public func zyf_object<T>(_ index: Int) -> T? {
        if index < self.count {
            return self[index] as? T
        }
        return nil
    }
    
    public func toString() -> String? {
        if self.count <= 0 {
            return nil
        }
        var string = ""
        for (i, item) in self.enumerated() {
            if i == 0 {
                string += "\(item)"
            }else {
                string += "-\(item)"
            }
        }
        return string
    }
   
}
