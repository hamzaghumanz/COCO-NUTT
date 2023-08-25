//
//  Date+.swift
//  Journey30
//
//  Created by Macbook 5 on 2/3/23.
//

import Foundation
extension Date {
    func toStringWithFormat(format: String) -> String {
        let formmatter = DateFormatter()
        formmatter.dateFormat = format
        return formmatter.string(from: self)
    }
    
    func toStringInHijri() -> String {
        let formmatter = DateFormatter()
        formmatter.dateFormat = "dd MMMM, yyyy G"
        formmatter.calendar = Calendar(identifier: Calendar.Identifier.islamicUmmAlQura)
        return formmatter.string(from: self)
    }
    
    func toStringHijriInFormat(format: String) -> String {
        let formmatter = DateFormatter()
        formmatter.dateFormat = format
        formmatter.calendar = Calendar(identifier: Calendar.Identifier.islamicUmmAlQura)
        return formmatter.string(from: self)
    }
    
   
    static func - (lhs: Date, rhs: Date) -> TimeInterval {
        return lhs.timeIntervalSinceReferenceDate - rhs.timeIntervalSinceReferenceDate
    }
    
    var isToday:Bool {
       return Calendar.current.isDate(self, inSameDayAs: Date())
    }

    var isSameMonth:Bool {
        return Calendar.current.isDate(self, equalTo: Date(), toGranularity: .month)
    }
    
    var isFutureDate:Bool {
        if self <= Date() {
            return false
        } else {
            return true
        }
    }

    
    var id:String {
        return self.toStringWithFormat(format: "dd-MMM-yyyy")
    }
    
    var idStamp:String {
        return self.toStringWithFormat(format: "dd-MMM-yyyy HH:mm ss")
    }
    
    var after30Days:Date {
        return Calendar.current.date(byAdding: .day, value: 30, to: self) ?? Date().addingTimeInterval(2592000)
    }
    
    func timeAgoDisplay(style:RelativeDateTimeFormatter.UnitsStyle = .short) -> String {
       let formatter = RelativeDateTimeFormatter()
       formatter.unitsStyle = style
       return formatter.localizedString(for: self, relativeTo: Date())
    }
}
internal extension Date {

    var day: Int {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.day], from: self)
        return components.day ?? 1
    }
    
    var month: Int {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.month], from: self)
        return components.month ?? 1
    }
    
    var year: Int {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year], from: self)
        return components.year ?? 1
    }
    
    var previousDay: Date {
        var components = DateComponents()
        components.day = -1
        return Calendar.current.date(byAdding: components, to: startOfDay)!
    }
    
    var nextDay: Date {
        var components = DateComponents()
        components.day = 1
        return Calendar.current.date(byAdding: components, to: startOfDay)!
    }
    
    var startOfDay: Date {
        return Calendar.current.startOfDay(for: self)
    }

    var endOfDay: Date {
        var components = DateComponents()
        components.day = 1
        components.second = -1
        return Calendar.current.date(byAdding: components, to: startOfDay)!
    }

    var startOfMonth: Date {
        let components = Calendar.current.dateComponents([.year, .month], from: startOfDay)
        return Calendar.current.date(from: components)!
    }

    var endOfMonth: Date {
        var components = DateComponents()
        components.month = 1
        components.second = -1
        return Calendar.current.date(byAdding: components, to: startOfMonth)!
    }
    
    var startOfWeek: Date {
        let gregorian = Calendar(identifier: .gregorian)
        let sunday = gregorian.date(from: gregorian.dateComponents([.yearForWeekOfYear, .weekOfYear], from: self))
        return sunday!
    }
    
    var startOfNextWeek: Date {
        let gregorian = Calendar(identifier: .gregorian)
        let sunday = gregorian.date(from: gregorian.dateComponents([.yearForWeekOfYear, .weekOfYear], from: self))
        return gregorian.date(byAdding: .weekOfMonth, value: 1, to: sunday!)!
    }
    
    var startOfPreviousWeek: Date {
        let gregorian = Calendar(identifier: .gregorian)
        let sunday = gregorian.date(from: gregorian.dateComponents([.yearForWeekOfYear, .weekOfYear], from: self))
        return gregorian.date(byAdding: .weekOfMonth, value: -1, to: sunday!)!
    }
    
    var weekDates: [Date] {
        var dates: [Date] = []
        for i in 0..<7 {
            dates.append(Calendar.current.date(byAdding: .day, value: i, to: startOfWeek)!)
        }
        return dates
    }
    
    var previousWeekDates: [Date] {
        var dates: [Date] = []
        for i in 0..<7 {
            dates.append(Calendar.current.date(byAdding: .day, value: i, to: startOfPreviousWeek)!)
        }
        return dates
    }
    
    var last28Days: [Date] {
        var dates: [Date] = []
        for i in 1...28 {
            dates.append(Calendar.current.date(byAdding: .day, value: -i, to: self)!)
        }
        return dates.reversed()
    }
    
    var startOfLastMonth: Date {
        if  let date = Calendar.current.date(byAdding: .month, value: -1, to: self) {
            let components = Calendar.current.dateComponents([.year, .month], from: date)
            let date = Calendar.current.date(from: components)!
            return date
        }
        return self
    }
    
    var endOfLastMonth: Date {
        var components = DateComponents()
        components.month = 1
        components.second = -1
        return Calendar.current.date(byAdding: components, to: startOfLastMonth)!
    }
    
    var dayOfTheWeek: Int {
         let dayNumber = Calendar.current.component(.weekday, from: self)
         // day number starts from 1 but array count from 0
         return dayNumber - 1
    }
    
    var startOfYear:Date {
        let comp: DateComponents = Calendar.current.dateComponents([.year], from: self)
        return Calendar.current.date(from: comp)!
    }
    
    var last5YearStart:Date {
        if  let date = Calendar.current.date(byAdding: .year, value: -5, to: self) {
            let comp: DateComponents = Calendar.current.dateComponents([.year], from: date)
            return Calendar.current.date(from: comp)!
        }
        return Date()
    }
    
    var last5YearEnd:Date {
        if  let date = Calendar.current.date(byAdding: .day, value: -1, to: startOfYear) {
            return date
        }
        return Date()
    }
    
    var iso8601: String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZZZZZ"
        return formatter.string(from: self)
    }
    
    func string(format: String = "dd-MM-yyyy") -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
    
    var nextDate: Date {
        var components = DateComponents()
        components.day = 1
        let date = Calendar.current.date(byAdding: components, to: startOfDay)!
        if date > Date() {
            return Date()
        }
        return Calendar.current.date(byAdding: components, to: startOfDay)!
    }
    
    var dayString: String {
        return self.toStringWithFormat(format: "dd-MMM-yyyy")
    }
    
    func isNextMonthFrom(start:Date) -> Bool {
        let secondsInMonth = TimeInterval(2628288)
        let diff = self - start
        return diff >= secondsInMonth
    }
  
}
extension Date {

    func fullDistance(from date: Date, resultIn component: Calendar.Component, calendar: Calendar = .current) -> Int? {
        calendar.dateComponents([component], from: self, to: date).value(for: component)
    }

    func distance(from date: Date, only component: Calendar.Component, calendar: Calendar = .current) -> Int {
        let days1 = calendar.component(component, from: self)
        let days2 = calendar.component(component, from: date)
        return days1 - days2
    }

    func hasSame(_ component: Calendar.Component, as date: Date) -> Bool {
        distance(from: date, only: component) == 0
    }
    
    func lessThanEqualBy(_ component: Calendar.Component,from date: Date) -> Bool {
        return fullDistance(from: date, resultIn: component) ?? 5 <= 0
    }
    
    func isFutureDay(from date: Date) -> Bool {
        return fullDistance(from: date, resultIn: .day) ?? 0 > 0
    }
    
}
