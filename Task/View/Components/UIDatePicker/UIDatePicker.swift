//
//  UIDatePicker.swift
//  Task
//
//  Created by Sara Babaei on 2/7/22.
//

import UIKit

extension UIDatePicker {
    
    func setUp(mode: UIDatePicker.Mode) {
        self.calendar = Calendar(identifier: .gregorian)
        self.locale = Locale(identifier: "en")
        self.timeZone = .current
        self.datePickerMode = mode
        if #available(iOS 13.4, *) {
            self.preferredDatePickerStyle = .wheels
        }
    }
}

