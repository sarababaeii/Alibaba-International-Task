//
//  CustomUIView.swift
//  Task
//
//  Created by Sara Babaei on 2/5/22.
//

import UIKit

@IBDesignable class CustomView: UIView {
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            self.layer.cornerRadius = self.cornerRadius
            
            if let topLayer = self.layer.sublayers?.first, topLayer is CAGradientLayer {
                topLayer.cornerRadius = self.cornerRadius
            }
        }
    }
    
    func setDiffrentCornerRadius(radius: CGFloat, corners: CACornerMask) {
        self.layer.cornerRadius = radius
        self.clipsToBounds = true
        self.layer.maskedCorners = corners
    }
    
    @IBInspectable var borderColor: UIColor = .white {
        didSet {
            self.layer.borderColor = borderColor.cgColor
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            self.layer.borderWidth = borderWidth
        }
    }
}
