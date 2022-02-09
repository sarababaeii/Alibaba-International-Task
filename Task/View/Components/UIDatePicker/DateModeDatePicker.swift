//
//  DateModeDatePicker.swift
//  Task
//
//  Created by Sara Babaei on 2/8/22.
//

import UIKit

class DateModeDatePicker: UIDatePicker {
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        self.setUp(mode: .date)
        setDefaultDate()
        setMinDate()
    }
    
    private func setDefaultDate() {
        if let tomorrow = Date().nextDay() {
            self.date = tomorrow
        }
    }
    
    private func setMinDate() {
        let todady = Date()
        self.minimumDate = todady
    }
}
