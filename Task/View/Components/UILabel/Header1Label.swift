//
//  Header1Label.swift
//  Task
//
//  Created by Sara Babaei on 2/6/22.
//

import UIKit

class Header1Label: CustomLabel {
    
    override func didMoveToSuperview() {
        setTextStyle()
    }

    private func setTextStyle() {
        self.font = .header1
        self.textColor = .black
    }
}
