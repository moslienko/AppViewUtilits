//
//  Extension+Date.swift
//  
//
//  Created by Pavel Moslienko on 02.06.2019.
//

import Foundation

public extension Date {
    var millisecondsSince1970: Int {
        return Int((self.timeIntervalSince1970 * 1000.0))
    }
    
    init(milliseconds: Int) {
        self = milliseconds.getDate()
    }
    
    func convertToTimeZone(initTimeZone: TimeZone, timeZone: TimeZone) -> Date {
        let delta = TimeInterval(timeZone.secondsFromGMT() - initTimeZone.secondsFromGMT())
        return addingTimeInterval(delta)
    }
    
    func convertToTimeZone() -> Date {
        let timezoneOffset = TimeZone(secondsFromGMT: 0)?.secondsFromGMT() ?? 0
        let epochDate = self.timeIntervalSince1970
        
        let timezoneEpochOffset = (epochDate + Double(timezoneOffset))
        let timeZoneOffsetDate = Date(timeIntervalSince1970: timezoneEpochOffset)
        
        return timeZoneOffsetDate
    }
    
    /**
     Перевод даты в строку
     
     - Parameter dateFormat: Формат даты
     - Returns: Строка
     **/
    func toString(dateFormat format: String ) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        
        return dateFormatter.string(from: self)
    }
    
    func toLocalDateString() -> String {
        let date = self
        let calendar = NSCalendar.current
        
        let day = calendar.component(.day, from: date)
        let month = calendar.component(.month, from: date)
        let year = calendar.component(.year, from: date)
        
        return "\(String(format: "%02d", day)).\(String(format: "%02d", month)).\(year)"
    }
    
    func toLocalTimeShortString() -> String {
        let date = self
        let calendar = NSCalendar.current
        
        let hour = calendar.component(.hour, from: date)
        let minute = calendar.component(.minute, from: date)
        
        return "\(String(format: "%02d", hour)):\(String(format: "%02d", minute))"
    }
    
    func toLocalDateTimeString() -> String {
        let date = self
        
        let calendar = NSCalendar.current
        
        let day = calendar.component(.day, from: date)
        let month = calendar.component(.month, from: date)
        let year = calendar.component(.year, from: date)
        let hour = calendar.component(.hour, from: date)
        let minute = calendar.component(.minute, from: date)
        
        return "\(String(format: "%02d", day)).\(String(format: "%02d", month)).\(year) \(String(format: "%02d", hour)):\(String(format: "%02d", minute))"
    }
    
    func isEquatableFor(_ secondDate: Date) -> Bool {
        return self.toLocalDateString() == secondDate.toLocalDateString()
    }
    
    //Входит ли дату в промежуток между двумя датами
    func isBetween(date date1: Date, andDate date2: Date) -> Bool {
        return date1.compare(self).rawValue * self.compare(date2).rawValue >= 0
    }
    
    var dayBefore: Date? {
        guard let noon = self.noon else { return nil }
        return Calendar.current.date(byAdding: .day, value: -1, to: noon)
    }
    
    var dayAfter: Date? {
        guard let noon = self.noon else { return nil }
        return Calendar.current.date(byAdding: .day, value: 1, to: noon)
    }
    
    var yearBefore: Date? {
        guard let noon = self.noon else { return nil }
        return Calendar.current.date(byAdding: .year, value: -1, to: noon)
    }
    
    var noon: Date? {
        return Calendar.current.date(bySettingHour: 12, minute: 0, second: 0, of: self)
    }
    
    var startDate: Date? {
        return Calendar.current.date(bySettingHour: 0, minute: 0, second: 0, of: self)
    }
    
    var startOfWeek: Date? {
        let calendar = Calendar(identifier: .iso8601)
        guard let monday = calendar.date(from: calendar.dateComponents([.yearForWeekOfYear, .weekOfYear], from: self)) else { return nil }
        return calendar.date(byAdding: .day, value: 0, to: monday)
    }
    
    var endOfWeek: Date? {
        let calendar = Calendar(identifier: .iso8601)
        guard let sunday = calendar.date(from: calendar.dateComponents([.yearForWeekOfYear, .weekOfYear], from: self)) else { return nil }
        return calendar.date(byAdding: .day, value: 7, to: sunday)
    }
    
    func get(_ components: Calendar.Component..., calendar: Calendar = Calendar.current) -> DateComponents {
        return calendar.dateComponents(Set(components), from: self)
    }
    
    func get(_ component: Calendar.Component, calendar: Calendar = Calendar.current) -> Int {
        return calendar.component(component, from: self)
    }
}
