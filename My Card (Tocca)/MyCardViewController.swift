//
//  ViewController.swift
//  My Card (Tocca)
//
//  Created by Johan Park on 7/1/19.
//  Copyright © 2019 Johan Park. All rights reserved.
//

import UIKit
import Foundation

class MyCardViewController: UIViewController {
    
    @IBOutlet weak var scanQRButton: UIButton!
    @IBOutlet weak var shareButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var myView: UIView!
    @IBOutlet weak var quickReaderImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpButtons()
        setUpImageView()
        generateQRCode()
        
        myView.addBottomRoundedEdge(desiredCurve: 0.7)
    }
    
    func setUpButtons() {
        scanQRButton.layer.cornerRadius = 0.5 * scanQRButton.bounds.size.width
        shareButton.layer.cornerRadius = 0.5 * shareButton.bounds.size.width
    }
    
    func setUpImageView() {
        imageView.layer.cornerRadius = 0.5 * imageView.bounds.size.width
        imageView.clipsToBounds = true
    }

    func generateQRCode() {
        // Get define string to encode
        let myString = "https://tocca.io"
        // Get data from the string
        let data = myString.data(using: String.Encoding.ascii)
        // Get a QR CIFilter
        guard let qrFilter = CIFilter(name: "CIQRCodeGenerator") else { return }
        // Input the data
        qrFilter.setValue(data, forKey: "inputMessage")
        // Get the output image
        guard let qrImage = qrFilter.outputImage else { return }
        // Scale the image
        let transform = CGAffineTransform(scaleX: 20, y: 20)
        let scaledQrImage = qrImage.transformed(by: transform)
        // Do some processing to get the UIImage
        let context = CIContext()
        guard let cgImage = context.createCGImage(scaledQrImage, from: scaledQrImage.extent) else { return }
        let processedImage = UIImage(cgImage: cgImage)
        
        quickReaderImage.image = processedImage
    }
}

// Create the rounded curve for UIView
extension UIView {
    func addBottomRoundedEdge(desiredCurve: CGFloat?) {
        let offset: CGFloat = self.frame.width / desiredCurve!
        let bounds: CGRect = self.bounds
        
        let rectBounds: CGRect = CGRect(x: bounds.origin.x, y: bounds.origin.y, width: bounds.size.width, height: bounds.size.height / 2)
        let rectPath: UIBezierPath = UIBezierPath(rect: rectBounds)
        let ovalBounds: CGRect = CGRect(x: bounds.origin.x - offset / 2, y: bounds.origin.y, width: bounds.size.width + offset, height: bounds.size.height)
        let ovalPath: UIBezierPath = UIBezierPath(ovalIn: ovalBounds)
        rectPath.append(ovalPath)
        
        let maskLayer: CAShapeLayer = CAShapeLayer()
        maskLayer.frame = bounds
        maskLayer.path = rectPath.cgPath
        
        self.layer.mask = maskLayer
    }
}

