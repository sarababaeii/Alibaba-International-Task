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
}
