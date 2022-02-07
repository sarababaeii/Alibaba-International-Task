//
//  UIDatePicker.swift
//  Task
//
//  Created by Sara Babaei on 2/7/22.
//

import UIKit

extension UIDatePicker {
    
    func setUp(mode: UIDatePicker.Mode) {
        self.locale = .current
//        self.calendar = Calendar(identifier: .gregorian)
//        self.timeZone = .current
//        self.timeZone = TimeZone(identifier: "Asia/Tehran")
        self.timeZone = TimeZone(secondsFromGMT: 0)
        print(self.locale)
        print(self.timeZone)
        self.datePickerMode = mode
        if #available(iOS 13.4, *) {
            self.preferredDatePickerStyle = .wheels
        }
    }
}

