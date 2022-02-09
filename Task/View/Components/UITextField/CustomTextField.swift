//
//  CustomTextField.swift
//  Task
//
//  Created by Sara Babaei on 2/6/22.
//

import UIKit

@IBDesignable class CustomTextField: UITextField {
    
    @IBInspectable var sidePadding: CGFloat = 12 {
        didSet {
            
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            self.layer.cornerRadius = self.cornerRadius
        }
    }
    
    @IBInspectable var borderColor: UIColor = UIColor.white {
        didSet {
            if hasBottomBorder {
                setBottomBorder(color: borderColor, width: borderWidth)
            } else {
                self.layer.borderColor = borderColor.cgColor
            }
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            if hasBottomBorder {
                setBottomBorder(color: borderColor, width: borderWidth)
            } else {
                self.layer.borderWidth = borderWidth
            }
        }
    }
    
    @IBInspectable var hasBottomBorder: Bool = false {
        didSet {
            if hasBottomBorder {
                setBottomBorder(color: borderColor, width: borderWidth)
            }
        }
    }
    
    func setBottomBorder(color: UIColor, width: CGFloat) {
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0, y: self.frame.size.height - 1, width: self.frame.size.width, height: width)
        bottomLine.backgroundColor = color.cgColor
        borderStyle = .none
        layer.addSublayer(bottomLine)
    }
        
    @IBInspectable var placeHolderColor: UIColor = UIColor(red: 202, green: 202, blue: 202, alpha: 1) {
        didSet {
            if let placeholder = self.placeholder {
                self.setPlaceHolderColor(string: placeholder, color: self.placeHolderColor)
            }
        }
    }
    
    func setPlaceHolderColor(string: String, color: UIColor) {
        self.attributedPlaceholder = NSAttributedString(string: string, attributes:[NSAttributedString.Key.foregroundColor: color])
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(
            x: bounds.origin.x + sidePadding,
            y: bounds.origin.y,
            width: bounds.size.width - sidePadding * 2,
            height: bounds.size.height
        )
    }

    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return self.textRect(forBounds: bounds)
    }
}
