//
//  Sequence+.swift
//  Journey30
//
//  Created by Macbook 5 on 2/9/23.
//

import Foundation

extension Sequence where Element == Int {
    
    var toData:Data? {
        let arrayData = try? NSKeyedArchiver.archivedData(withRootObject: self, requiringSecureCoding: false)
        return arrayData
    }
    
}
extension Data {
    
    var toIntArray:[Int] {
        let array = try? NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(self) as? [Int]
        return array ?? []
    }
}
extension Sequence where Element == Date {
    
    var streaks: Int {
        let oneDayInSeconds: Double = 60*60*24
        let days = self.compactMap { Calendar.current.date(bySettingHour: 0, minute: 0, second: 0, of: $0) }
        let uniq = Set(days).sorted(by: >)
        
        var count = 0
        guard var lastStreak = Calendar.current.date(bySettingHour: 0, minute: 0, second: 0, of: Date()) else { return count }
        
        for date in uniq {
            guard date > lastStreak.advanced(by: -oneDayInSeconds - 1) else { break }
            count += 1
            lastStreak = date
        }
        
        return count
    }
    
}
