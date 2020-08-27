//
//  SourceTools.swift
//  Pods-WKExtension_Example
//
//  Created by ztesa on 2020/8/27.
//

import UIKit

public class SourceTools: NSObject {
    static var bundle: Bundle = {
        let bundle = Bundle.init(path: Bundle.init(for: SourceTools.self).path(forResource: "SourceAsset", ofType: "bundle", inDirectory: nil)!)
        return bundle!
    }()
    
    public static func getBundleImg(with name: String) -> UIImage? {
        var image = UIImage(named: name, in: bundle, compatibleWith: nil)
        if image == nil {
            image = UIImage(named: name)
        }
        return image
    }
    
}
