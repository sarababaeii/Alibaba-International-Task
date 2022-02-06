//
//  BorderedRoundedView.swift
//  Task
//
//  Created by Sara Babaei on 2/6/22.
//

import UIKit

@IBDesignable class BorderedRoundedView: RoundedView {
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
    }
    
    func setBorder(color: UIColor) {
        self.borderColor = color
        self.borderWidth = 1
    }
}
