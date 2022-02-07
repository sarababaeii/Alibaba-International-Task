//
//  Header2Label.swift
//  Task
//
//  Created by Sara Babaei on 2/7/22.
//

import UIKit

class Header2Label: CustomLabel {
    
    override func didMoveToSuperview() {
        setTextStyle()
    }

    private func setTextStyle() {
        self.font = .header2
        self.textColor = .black
    }
}
