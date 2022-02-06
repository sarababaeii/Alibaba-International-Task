//
//  CustomButton.swift
//  Task
//
//  Created by Sara Babaei on 2/5/22.
//

import UIKit

@IBDesignable class CustomButton: UIButton {
    
    var defaultBackgroundColor: UIColor?
    var isDisablable = false
    
    //MARK: Corner Radius
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            self.layer.cornerRadius = self.cornerRadius
        }
    }
    
    func setDiffrentCornerRadius(radius: CGFloat, corners: CACornerMask) {
        self.layer.cornerRadius = radius
        self.clipsToBounds = true
        self.layer.maskedCorners = corners
    }
    
    //MARK: Border
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
    
    func setBackground(color: UIColor) {
        self.backgroundColor = color
        self.defaultBackgroundColor = color
    }
    
    func enable() {
        isEnabled = true
        backgroundColor = defaultBackgroundColor
    }
    
    func disable() {
        isEnabled = false
        if isDisablable {
            backgroundColor = .white
        }
    }
}
