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
        self.setUp(mode: .dateAndTime)
//        setDefaultDate()
//        setMinDate()
    }
    
    private func setDefaultDate() {
        print(self.date)
        if let tomorrow = self.date.nextDay() {
            print(tomorrow)
            self.date = tomorrow
        }
        print(self.date)
//        print(self.timeZone)
//        print(Date())
//        if let tomorrow = Date().nextDay(),
//           let gmt = TimeZone(secondsFromGMT: 0) {
//            let currentTomorrow = tomorrow.convertToTimeZone(from: gmt, to: .current)
//            print(tomorrow)
//            print(gmt)
//            print(currentTomorrow)
//            self.date = currentTomorrow
//        }
    }
    
    private func setMinDate() {
        if let gmt = TimeZone(secondsFromGMT: 0) {
            self.minimumDate = Date().convertToTimeZone(from: gmt, to: .current)
        }
    }
}
