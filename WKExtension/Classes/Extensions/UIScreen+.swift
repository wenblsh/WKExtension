//
//  UIScreen+.swift
//  empty-project
//
//  Created by ztesa on 2020/8/24.
//  Copyright © 2020 冰璐守恒. All rights reserved.
//

import Foundation

import UIKit

extension UIScreen {
    static public var width: CGFloat {return UIScreen.main.bounds.width}
    static public var height: CGFloat {return UIScreen.main.bounds.height}
    /// 4 4s
    static public var is4s: Bool {
        return UIScreen.main.currentMode?.size == CGSize(width: 640, height: 960)
    }
    /// 5 5s 5c se
    static public var is5: Bool {
        return UIScreen.main.currentMode?.size == CGSize(width: 640, height: 1136)
    }
    /// 6 6s 7 8
    static public var is6: Bool {
        return UIScreen.main.currentMode?.size == CGSize(width: 750, height: 1334)
    }
    /// 6p 6sp 7p 8p
    static public var is6plus: Bool {
        return UIScreen.main.currentMode?.size == CGSize(width: 1242, height: 2208)
    }
    /// x xs
    static public var isX: Bool {
        return UIScreen.main.currentMode?.size == CGSize(width: 1125, height: 2436)
    }
    /// xr
    static public var isXR: Bool {
        return UIScreen.main.currentMode?.size == CGSize(width: 828, height: 1792)
    }
    /// xsmax
    static public var isXMax: Bool {
        return UIScreen.main.currentMode?.size == CGSize(width: 1242, height: 2688)
    }
    
    /// statusBar height
    static public var statusBarHeight: CGFloat {
        return (isX || isXR || isXMax) ? 30 : 20
    }
    /// navBar heihgt
    static public var navBarHeight: CGFloat {
        return (isX || isXR || isXMax) ? 88 : 64
    }
    /// tabBar heihgt
    static public var tabBarHeight: CGFloat {
        return (isX || isXR || isXMax) ? 83 : 49
    }
}
