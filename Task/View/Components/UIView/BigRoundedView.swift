//
//  BigRoundedView.swift
//  Task
//
//  Created by Sara Babaei on 2/7/22.
//

import UIKit

@IBDesignable class BigRoundedView: CustomView {
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        setRadius()
    }
    
    private func setRadius() {
        self.cornerRadius = 12
    }
}
