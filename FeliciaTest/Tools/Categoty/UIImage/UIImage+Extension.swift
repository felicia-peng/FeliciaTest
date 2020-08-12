//
//  UIImage+Extension.swift
//  water_conservancy_ios
//
//  Created by codeLocker on 2019/8/11.
//  Copyright © 2019 codeLocker. All rights reserved.
//

import Foundation
import UIKit
import CoreGraphics
import AVFoundation

extension UIImage {
    public static func es_imageFromBundle(name: String?, type: String?) -> UIImage? {
        guard let name = name, let type = type else {
            return nil
        }
        guard let path = Bundle.main.path(forResource: name, ofType: type) else {
            return nil
        }
        return UIImage.init(contentsOfFile: path)
    }
    
    func es_fixOrientation() -> UIImage {
        if self.imageOrientation == .up {
            return self
        }
        var transform = CGAffineTransform.identity
        switch self.imageOrientation {
        case .down, .downMirrored:
            transform = transform.translatedBy(x: self.size.width, y: self.size.height)
            transform = transform.rotated(by: .pi)
            break
        case .left, .leftMirrored:
            transform = transform.translatedBy(x: self.size.width, y: 0)
            transform = transform.rotated(by: .pi / 2)
            break
        case .right, .rightMirrored:
            transform = transform.translatedBy(x: 0, y: self.size.height)
            transform = transform.rotated(by: -.pi / 2)
            break
        default:
            break
        }
        switch self.imageOrientation {
        case .upMirrored, .downMirrored:
            transform = transform.translatedBy(x: self.size.width, y: 0)
            transform = transform.scaledBy(x: -1, y: 1)
            break
        case .leftMirrored, .rightMirrored:
            transform = transform.translatedBy(x: self.size.height, y: 0);
            transform = transform.scaledBy(x: -1, y: 1)
            break
        default:
            break
        }
        let ctx = CGContext(data: nil, width: Int(self.size.width), height: Int(self.size.height), bitsPerComponent: self.cgImage!.bitsPerComponent, bytesPerRow: 0, space: self.cgImage!.colorSpace!, bitmapInfo: self.cgImage!.bitmapInfo.rawValue)
        ctx?.concatenate(transform)
        switch self.imageOrientation {
        case .left, .leftMirrored, .right, .rightMirrored:
            ctx?.draw(self.cgImage!, in: CGRect(x: CGFloat(0), y: CGFloat(0), width: CGFloat(size.height), height: CGFloat(size.width)))
            break
        default:
            ctx?.draw(self.cgImage!, in: CGRect(x: CGFloat(0), y: CGFloat(0), width: CGFloat(size.width), height: CGFloat(size.height)))
            break
        }
        let cgimg: CGImage = (ctx?.makeImage())!
        let img = UIImage(cgImage: cgimg)
        return img
        
    }
    
    static func es_thumbnailImageForVideo(_ url: String?) -> UIImage? {
        guard let url = url else {
            return nil
        }
        guard let tmpUrl = URL.init(string: url) else {
            return nil
        }
        let asset = AVURLAsset.init(url: tmpUrl)
        let assetGen = AVAssetImageGenerator.init(asset: asset)
        assetGen.appliesPreferredTrackTransform = true
        let time = CMTimeMake(value: 0, timescale: 600)
        guard let imageRef = try? assetGen.copyCGImage(at: time, actualTime: nil) else {
            return nil
        }
        let thumbnailImage = UIImage.init(cgImage: imageRef)
        return thumbnailImage
    }
}

