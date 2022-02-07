//
//  AccentButton.swift
//  Task
//
//  Created by Sara Babaei on 2/6/22.
//

import UIKit

@IBDesignable class AccentButton: RoundedButton {
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        setColor()
        setTextStyle()
    }
    
    private func setColor() {
        super.setBackground(color: .accent)
    }
    
    private func setTextStyle() {
        self.titleLabel?.font = .button1
        self.titleLabel?.textColor = .white
    }
    
    func changeAbility(to isEnabled: Bool) {
        self.isEnabled = isEnabled
    }
}
