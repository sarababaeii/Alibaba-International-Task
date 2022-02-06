//
//  BlueBorderedView.swift
//  Task
//
//  Created by Sara Babaei on 2/6/22.
//

import UIKit

@IBDesignable class BlueBorderedView: BorderedRoundedView {
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        super.setBorder(color: .accent)
    }
}
