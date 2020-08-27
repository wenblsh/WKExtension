//
//  UIResponder+.swift
//  PeasantryAssistance
//
//  Created by ztesa on 2020/7/2.
//  Copyright © 2020 blsh. All rights reserved.
//

import Foundation
 
extension UIResponder {
    @objc public func userInteractionWithMethod(_ methodName: String, params: Any) {
        if (self.next != nil) {
            self.next?.userInteractionWithMethod(methodName, params: params)
        }
    }
}
