//
//  UITextField.swift
//  Task
//
//  Created by Sara Babaei on 2/6/22.
//

import UIKit

extension UITextField {
    func fetchInput() -> String? {
        if let caption = self.text?.trimmingCharacters(in: .whitespaces) {
            return caption.count > 0 ? caption : nil
        }
        return nil
    }
}
