//
//  BottomBorderedTextField.swift
//  Task
//
//  Created by Sara Babaei on 2/6/22.
//

import UIKit

class BottomBorderedTextField: CustomTextField {
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        setBorder()
        setTextStyle()
    }

    private func setBorder() {
        setBottomBorder(color: .lightGray, width: 1.0)
    }
    
    private func setTextStyle() {
        self.font = .textField1
        self.textColor = .black
    }
}
