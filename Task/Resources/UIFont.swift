//
//  UIFont.swift
//  Task
//
//  Created by Sara Babaei on 2/6/22.
//

import UIKit

extension UIFont {

    class var header1: UIFont {
        return UIFont.systemFont(ofSize: 17.0, weight: .semibold)
    }
    
    class var header2: UIFont {
        return UIFont.systemFont(ofSize: 14.0, weight: .semibold)
    }
    
    class var body1: UIFont {
        return UIFont.systemFont(ofSize: 12.0, weight: .regular)
    }
    
    class var body2: UIFont {
        return UIFont.systemFont(ofSize: 14.0, weight: .regular)
    }
    
    class var button1: UIFont {
        return UIFont.systemFont(ofSize: 16.0, weight: .semibold)
    }
    
    class var textField1: UIFont {
        return UIFont.systemFont(ofSize: 16.0, weight: .regular)
    }
}
