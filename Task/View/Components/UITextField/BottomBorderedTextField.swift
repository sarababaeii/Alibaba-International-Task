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
    }

    private func setBorder() {
        setBottomBorder(color: .lightGray, width: 1.0)
    }
}
