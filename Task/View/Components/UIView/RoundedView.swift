//
//  RoundedView.swift
//  Task
//
//  Created by Sara Babaei on 2/5/22.
//

import UIKit

@IBDesignable class RoundedView: CustomView {
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        setRadius()
    }
    
    private func setRadius() {
        self.cornerRadius = 10
    }
}
