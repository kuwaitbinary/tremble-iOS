//
//  QRCodeViewController.swift
//  Tremble-iOS
//
//  Created by Omar Alobaid on 11/2/15.
//  Copyright © 2015 Techzone. All rights reserved.
//

import UIKit

class QRCodeViewController: UIViewController {

    @IBOutlet weak var QRImageOutlet: UIImageView!
    
    override func viewDidAppear(animated: Bool) {
        
        let defaultData = NSUserDefaults.standardUserDefaults()
        let id = defaultData.objectForKey("SISID")?.description
        
        var QRData = (generateRandomBefore(10) as String) + "x" + id! + "L" + (generateRandomAfter(10) as String)
        
        QRData += ";"
        
        let data = QRData.dataUsingEncoding(NSISOLatin1StringEncoding, allowLossyConversion: false)
        
        let filter = CIFilter(name: "CIQRCodeGenerator")
        
        filter!.setValue(data, forKey: "inputMessage")
        filter!.setValue("Q", forKey: "inputCorrectionLevel")
        
        var qrcodeImage: CIImage!
        qrcodeImage = filter!.outputImage
        
        let scaleX = QRImageOutlet.frame.size.width / qrcodeImage.extent.size.width
        let scaleY = QRImageOutlet.frame.size.height / qrcodeImage.extent.size.height
        
        let transformedImage = qrcodeImage.imageByApplyingTransform(CGAffineTransformMakeScale(scaleX, scaleY))
        
        QRImageOutlet.image = UIImage(CIImage: transformedImage)
        
    }
    
    func generateRandomBefore(len : Int) -> NSString {
        
        let letters : NSString = "abcdefghijklmnopqrstuvwyzABCDEFGHIJKLMNOPQRSTUVWXYZ123456789012345678901234567890123456789012345678901234567890+@"
        
        var randomString : NSMutableString = NSMutableString(capacity: len)
        
        for (var i=0; i < len; i++){
            var length = UInt32 (letters.length)
            var rand = arc4random_uniform(length)
            randomString.appendFormat("%C", letters.characterAtIndex(Int(rand)))
        }
        
        return randomString
    }
    
    func generateRandomAfter(len : Int) -> NSString {
        
        let letters : NSString = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKMNOPQRSTUVWXYZ123456789012345678901234567890123456789012345678901234567890+@"
        
        var randomString : NSMutableString = NSMutableString(capacity: len)
        
        for (var i=0; i < len; i++){
            var length = UInt32 (letters.length)
            var rand = arc4random_uniform(length)
            randomString.appendFormat("%C", letters.characterAtIndex(Int(rand)))
        }
        
        return randomString
    }

}