//
//  rectangleView.swift
//  Tremble
//
//  Created by Abduallah Al Mashmoum on 10/28/15.
//  Copyright © 2015 Techzone. All rights reserved.
//

import UIKit

class rectangleView: UIView {

    /*
     Only override drawRect: if you perform custom drawing.
     An empty implementation adversely affects performance during animation.

*/
    override func drawRect(rect: CGRect) {
      
        //// General Declarations
        let context = UIGraphicsGetCurrentContext()
        
        //// Color Declarations
        let gradientColor = UIColor(red: 0.080, green: 0.480, blue: 0.680, alpha: 1.000)
        let gradientColor2 = UIColor(red: 0.000, green: 0.000, blue: 0.000, alpha: 1.000)
        let strokeColor = UIColor(red: 1.000, green: 1.000, blue: 1.000, alpha: 1.000)
        
        //// Gradient Declarations
        let gradient = CGGradientCreateWithColors(CGColorSpaceCreateDeviceRGB(), [gradientColor.CGColor, gradientColor2.CGColor], [0, 1])!
        
        //// Rectangle 4 Drawing
        let rectangle4Path = UIBezierPath(rect: CGRectMake(0, 0, 375, 667))
        CGContextSaveGState(context)
        rectangle4Path.addClip()
        CGContextDrawLinearGradient(context, gradient,
            CGPointMake(187.5, 222.92),
            CGPointMake(187.5, 957.49),
            [CGGradientDrawingOptions.DrawsBeforeStartLocation, CGGradientDrawingOptions.DrawsAfterEndLocation])
        CGContextRestoreGState(context)
        
        
        //// Group 4
        CGContextSaveGState(context)
        CGContextSetAlpha(context, 0.65)
        CGContextBeginTransparencyLayer(context, nil)
        
        //// Clip Clip 3
        let clip3Path = UIBezierPath(roundedRect: CGRectMake(46, 264, 281.9, 38), cornerRadius: 19)
        clip3Path.addClip()
        
        
        //// Group 5
        CGContextSaveGState(context)
        CGContextBeginTransparencyLayer(context, nil)
        
        //// Clip Clip 2
        let clip2Path = UIBezierPath(rect: CGRectMake(45.3, 262.5, 284, 41))
        clip2Path.addClip()
        
        
        //// Rectangle 8 Drawing
        let rectangle8Path = UIBezierPath(roundedRect: CGRectMake(46, 264, 281.9, 38), cornerRadius: 19)
        strokeColor.setStroke()
        rectangle8Path.lineWidth = 8
        rectangle8Path.stroke()
        
        
        CGContextEndTransparencyLayer(context)
        CGContextRestoreGState(context)
        
        
        CGContextEndTransparencyLayer(context)
        CGContextRestoreGState(context)
        
        
        //// Group
        CGContextSaveGState(context)
        CGContextSetAlpha(context, 0.65)
        CGContextBeginTransparencyLayer(context, nil)
        
        //// Clip Clip 4
        let clip4Path = UIBezierPath(roundedRect: CGRectMake(46, 327, 281.9, 38), cornerRadius: 19)
        clip4Path.addClip()
        
        
        //// Group 2
        CGContextSaveGState(context)
        CGContextBeginTransparencyLayer(context, nil)
        
        //// Clip Clip
        let clipPath = UIBezierPath(rect: CGRectMake(45.3, 325.5, 284, 41))
        clipPath.addClip()
        
        
        //// Rectangle Drawing
        let rectanglePath = UIBezierPath(roundedRect: CGRectMake(46, 327, 281.9, 38), cornerRadius: 19)
        strokeColor.setStroke()
        rectanglePath.lineWidth = 8
        rectanglePath.stroke()
        
        
        CGContextEndTransparencyLayer(context)
        CGContextRestoreGState(context)
        
        
        CGContextEndTransparencyLayer(context)
        CGContextRestoreGState(context)



     }


}
