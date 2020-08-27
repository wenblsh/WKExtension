//
//  UIImage+.swift
//  PeasantryAssistance
//
//  Created by ztesa on 2020/7/30.
//  Copyright © 2020 blsh. All rights reserved.
//

import Foundation
import UIKit
import AVKit

extension UIImage {
    // MARK: 根据视频url和时间点截图
    /// 根据视频url和时间点截图
    /// - Parameters:
    ///   - videoURL: 视频URL
    ///   - time: 时间点
    /// - Returns: 缩略图
    static public func thumbnailImageForVideo(videoURL: URL, time: TimeInterval) -> UIImage? {
        let asset = AVURLAsset.init(url: videoURL, options: nil)
        let assetImageGenerator = AVAssetImageGenerator(asset: asset)
        assetImageGenerator.appliesPreferredTrackTransform = true
        assetImageGenerator.apertureMode = AVAssetImageGenerator.ApertureMode.encodedPixels
        let thumbnailCGImage: CGImage?
        let thumbnailImageTime: CFTimeInterval = time
        var thumbnailImage: UIImage?
        do {
            thumbnailCGImage = try assetImageGenerator.copyCGImage(at: CMTimeMake(Int64(thumbnailImageTime),60), actualTime: nil)
            if let cgImage = thumbnailCGImage {
                thumbnailImage = UIImage(cgImage: cgImage)
            }
            
        } catch {
            
        }
        
        return thumbnailImage
    }
    
    // MARK: 获取屏幕截图
    /// 获取屏幕截图
    /// - Returns: image
    static public func getScreenSnap() -> UIImage?{
        //获取到window
        let window = UIApplication.shared.keyWindow
        return  window?.screenShot()
    }
    
    /// 生成指定颜色背景的图片
    ///
    /// - Parameters:
    ///   - color: 背景色
    ///   - size:
    /// - Returns: image
    static public func image(with color: UIColor, size: CGSize = CGSize(width: 1, height: 1)) -> UIImage {
        let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(color.cgColor)
        context?.fill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
}
