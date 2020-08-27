//
//  UITableView+.swift
//  PeasantryAssistance
//
//  Created by 冰璐守恒 on 2019/6/18.
//  Copyright © 2019 zhuyifeng. All rights reserved.
//

import Foundation

extension UITableView {
    
    public func addBackgroundView(_ view: UIView, insets: UIEdgeInsets) {
        view.frame = CGRect(x: insets.left,
                            y: insets.top,
                            width: self.contentSize.width-insets.left-insets.right,
                            height: self.contentSize.height-insets.top-insets.bottom)
        self.backgroundView = UIView()
        self.backgroundView?.insertSubview(view, at: 0)
    }
    
    public func updateBackgroundView(_ insets: UIEdgeInsets) {
        self.backgroundView?.frame = CGRect(x: insets.left,
                                            y: insets.top,
                                            width: self.contentSize.width-insets.left-insets.right,
                                            height: self.contentSize.height-insets.top-insets.bottom)
    }
}
