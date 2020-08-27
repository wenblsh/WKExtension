//
//  UIStoryboard+.swift
//  PeasantryAssistance
//
//  Created by 冰璐守恒 on 2019/5/31.
//  Copyright © 2019 zhuyifeng. All rights reserved.
//

import UIKit

extension UIStoryboard {
    class public func instantiateViewController<T: UIViewController>(name: String, identifier: String) -> T {
        let storyboard = UIStoryboard(name: name, bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: identifier) as! T
    }
}
