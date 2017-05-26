//
//  Shared.swift
//  Ditto
//
//  Created by Rana on 5/24/17.
//  Copyright © 2017 appConcept. All rights reserved.
//

import Foundation
import UIKit

class Shared {
//    class func ButtonRadius(_ button:UIButton){
//        button.layer.cornerRadius = button.layer.frame.size.height/2;
//        button.layer.masksToBounds = true;
//    }
    
    class func CustomButton(_ button:UIButton ,borderColor:UIColor ,borderWidth:Float)
    {
        button.layer.cornerRadius = button.layer.frame.size.height/2;
        button.layer.borderColor = borderColor.cgColor;
        button.layer.borderWidth=CGFloat(borderWidth);
        button.layer.masksToBounds = true;
    }
    
    class Image {
        
        class func scaleImage (_ oldImage:UIImage?,width:Int?) -> UIImage?{
            if let cgImage = oldImage?.cgImage {
                
                let nwidth = width ?? cgImage.width / 2
                let nheight = ( cgImage.height * width! / cgImage.width ) ?? cgImage.height / 2
                let bitsPerComponent = cgImage.bitsPerComponent
                let bytesPerRow = cgImage.bytesPerRow
                let colorSpace = cgImage.colorSpace
                let bitmapInfo = cgImage.bitmapInfo
                
                if let  context = CGContext(data: nil, width: width!, height: nheight, bitsPerComponent: bitsPerComponent, bytesPerRow: bytesPerRow, space: colorSpace!, bitmapInfo: bitmapInfo.rawValue) {
                    
                    context.interpolationQuality = CGInterpolationQuality.medium;
                    
                    context.draw(cgImage, in: CGRect(origin: CGPoint.zero, size: CGSize(width: CGFloat(nwidth), height: CGFloat(nheight))));
                    
                    let scaledImage = context.makeImage().flatMap { UIImage(cgImage: $0) }
                    return scaledImage
                }
            }
            
            
            return nil
            
        }
        
    }

}

