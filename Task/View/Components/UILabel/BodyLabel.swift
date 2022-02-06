//
//  BodyLabel.swift
//  Task
//
//  Created by Sara Babaei on 2/6/22.
//

import UIKit

class BodyLabel: CustomLabel {
    
    override func didMoveToSuperview() {
        setIsMultiLine()
        setTextStyle()
    }

    private func setIsMultiLine() {
        self.isMultiLine = true
    }
    
    private func setTextStyle() {
        self.font = .body1
        self.textColor = .black
    }
}
