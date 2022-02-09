//
//  UIViewController.swift
//  Task
//
//  Created by Sara Babaei on 2/6/22.
//

import UIKit

extension UIViewController {
    
    //MARK: Navigation Bar Visibility
    func setNavigationBarHidden(_ isHidden: Bool) {
        navigationController?.setNavigationBarHidden(isHidden, animated: true)
    }
    
    //MARK: Showing Next ViewController
    func activeSegue(with identifier: String) {
        performSegue(withIdentifier: identifier, sender: nil)
    }
    
    //MARK: Toast Message
    func showToast(message : String, backgroundColor: UIColor, textColor: UIColor) {
        let toastLabel = UILabel(frame: CGRect(x: (self.view.frame.size.width - 320)/2, y: self.view.frame.size.height-130, width: 310, height: 41)) //TODO: set size
        toastLabel.backgroundColor = backgroundColor
        toastLabel.textColor = textColor
        toastLabel.font = .button1
        toastLabel.textAlignment = .center;
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 20;
        toastLabel.clipsToBounds  =  true
        self.view.addSubview(toastLabel)
        
        UIView.animate(withDuration: 4.0, delay: 2, options: .curveEaseOut, animations: {
             toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })
    }
}
