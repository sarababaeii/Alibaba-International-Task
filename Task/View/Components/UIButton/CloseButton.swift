//
//  CloseButton.swift
//  Task
//
//  Created by Sara Babaei on 2/6/22.
//

import UIKit

@IBDesignable class CloseButton: CustomButton {
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        setColor()
    }
    
    private func setColor() {
        self.tintColor = .accent
    }
    
//    private func setImage() {
//        if #available(iOS 13.0, *) {
//            self.imageView?.image = UIImage(systemName: "xmark")
//        } else {
//            // Fallback on earlier versions
//        }
//    }
}
