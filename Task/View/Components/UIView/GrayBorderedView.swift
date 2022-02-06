//
//  GrayBorderedView.swift
//  Task
//
//  Created by Sara Babaei on 2/6/22.
//

import UIKit

@IBDesignable class GrayBorderedView: BorderedRoundedView {
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        super.setBorder(color: .gray)
    }
}
