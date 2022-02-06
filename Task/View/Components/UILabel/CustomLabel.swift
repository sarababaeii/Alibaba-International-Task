//
//  CustomLabel.swift
//  Task
//
//  Created by Sara Babaei on 2/6/22.
//

import UIKit

@IBDesignable class CustomLabel: UILabel {
    
    @IBInspectable var isMultiLine: Bool = false {
        didSet {
            if isMultiLine {
                self.numberOfLines = 0
            } else {
                self.numberOfLines = 1
            }
        }
    }
}
