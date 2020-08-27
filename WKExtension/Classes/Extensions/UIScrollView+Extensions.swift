//
//  UIScrollView+Extensions.swift
//  SmartCloud
//
//  Created by 冰璐守恒 on 16/5/17.
//  Copyright © 2016年 SmartPower. All rights reserved.
//

import UIKit
extension UIScrollView {
    
    fileprivate static var _noDataLabel:UILabel?
    
    fileprivate static var _noDataImage: UIImageView?
    
    fileprivate static var _noDataImageForStudyHome: UIImageView?
    
    static public var noDataLabel:UILabel! {
        get{
            if _noDataLabel == nil {
                _noDataLabel = UILabel()
                _noDataLabel!.text = "未查询到数据"
                _noDataLabel!.textAlignment = NSTextAlignment.center
                _noDataLabel?.textColor = UIColor.lightGray
                _noDataLabel?.font = UIFont.systemFont(ofSize: 15)
            }
            
            return _noDataLabel
        }
    }
    
    static public var noDataView:UIImageView! {
        get{
            if _noDataImage == nil {
                _noDataImage = UIImageView()
                _noDataImage?.contentMode = .scaleAspectFill
                _noDataImage?.image = UIImage(named: "pc_message_none")
            }
            
            return _noDataImage
        }
    }
    
    public func showNoDataView(_ image: UIImage? = UIImage(named: "pc_message_none"), title: String? = "未查询到数据", offSet: CGFloat = -44, rect: CGRect=CGRect.zero) {
        UIScrollView.noDataView.image = image
        if rect == .zero {
            UIScrollView.noDataView.sizeToFit()
            UIScrollView.noDataView.center = CGPoint(x: self.bounds.midX, y: self.bounds.midY+offSet)
        }else {
            UIScrollView.noDataView.frame = rect
            UIScrollView.noDataView.contentMode = .center
        }
        UITableView.noDataLabel.frame = CGRect(x: 0, y: UIScrollView.noDataView.frame.maxY + 10, width: self.frame.width, height: 50)
        UITableView.noDataLabel.text = title
        self.addSubview(UIScrollView.noDataLabel)
        self.addSubview(UIScrollView.noDataView)
        UIScrollView.noDataView.isHidden = false
        UIScrollView.noDataLabel.isHidden = false
    }
    
    public func hideNoDataView() {
        UIScrollView.noDataLabel.isHidden = true
        UIScrollView.noDataView.isHidden = true
    }
    
    public func showNoDataLabel(_ text:String? = nil) {
        UITableView.noDataLabel.frame = CGRect(x: 0, y: self.frame.height * 0.4, width: self.frame.width, height: 50)
        if text != nil {
            UITableView.noDataLabel.text = text
        }
        else{
            UITableView.noDataLabel.text = "未查询到数据"
        }
        
        self.addSubview(UITableView.noDataLabel)
        UITableView.noDataLabel.isHidden = false
    }
    
    public func hideNoDataLabel() {
        UITableView.noDataLabel.isHidden = true
    }
}
