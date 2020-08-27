//
//  FileManager+.swift
//  empty-project
//
//  Created by ztesa on 2020/8/24.
//  Copyright © 2020 冰璐守恒. All rights reserved.
//

import Foundation
extension FileManager {
    /// 沙盒目录路径
    static public var homeDirectory: String {
        return NSHomeDirectory()
    }
    
    /// 沙盒temp路径
    static public var tempDirectory: String {
        return NSTemporaryDirectory()
    }
    
    /// 沙盒documents路径
    static public var documentsDirectory: String {
        return NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
    }
    
    /// 沙盒library路径
    static public var libraryDirectory: String {
        return NSSearchPathForDirectoriesInDomains(.libraryDirectory, .userDomainMask, true)[0]
    }
    
    /// 沙盒cache路径
    static public var cacheDirectory: String {
        return NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true)[0]
    }
}
