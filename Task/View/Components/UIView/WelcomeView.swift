//
//  WelcomeView.swift
//  Task
//
//  Created by Sara Babaei on 2/9/22.
//

import UIKit

class WelcomeView: BlueBorderedView {
    
    func hide(from viewController: UIViewController, newConstraint: NSLayoutConstraint, oldConstraint: NSLayoutConstraint) {
        UIView.animate(withDuration: 1.0, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .allowUserInteraction, animations: {
            self.alpha = 0
            oldConstraint.isActive = false
            newConstraint.constant = 24
            newConstraint.isActive = true
            viewController.view.layoutIfNeeded()
           }, completion: {_ in
            self.isHidden = true
          })
    }
}
