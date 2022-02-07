//
//  Date.swift
//  Task
//
//  Created by Sara Babaei on 2/8/22.
//

import Foundation

extension Date {
    
    func convertToTimeZone(from initTimeZone: TimeZone, to timeZone: TimeZone) -> Date {
         let delta = TimeInterval(timeZone.secondsFromGMT(for: self) - initTimeZone.secondsFromGMT(for: self))
         return addingTimeInterval(delta)
    }
    
    //MARK: Getting Specific Dates
    func nextDay() -> Date? {
        let calendar = Calendar.current
        if let tomorrow = calendar.date(byAdding: .day, value: 1, to: self) {
            return tomorrow
//            return calendar.startOfDay(for: tommorow)
        }
        return nil
    }
}
