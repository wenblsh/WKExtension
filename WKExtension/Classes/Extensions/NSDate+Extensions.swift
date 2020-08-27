//
//  NSDate+Extensions.swift
//  SmartCloud
//
//  Created by 冰璐守恒 on 16/5/16.
//  Copyright © 2016年 SmartPower. All rights reserved.
//
import UIKit

extension Date {
    // MARK: 对比两个日期是否是同一天
    /// 对比两个日期是否是同一天
    /// - Parameter date: 对比的日期
    /// - Returns: Bool
    public func isToday(_ date: Date) -> Bool {
        let currentCalendar = Calendar.current
        let nowComponents = (currentCalendar as NSCalendar).components([.day, .month, .year], from: date)
        let selfComponents = (currentCalendar as NSCalendar).components([.day, .month, .year], from: self)
        
        return
            (selfComponents.year == nowComponents.year) &&
                (selfComponents.month == nowComponents.month) &&
                (selfComponents.day == nowComponents.day)
    }
    
    // MARK: 是否是同一天
    /// 与当前日期对比是否是同一天
    /// - Returns: Bool
    public func isToday() -> Bool {
        let currentCalendar = Calendar.current
        let nowComponents = (currentCalendar as NSCalendar).components([.day, .month, .year], from: Date())
        let selfComponents = (currentCalendar as NSCalendar).components([.day, .month, .year], from: self)
        
        return
            (selfComponents.year == nowComponents.year) &&
            (selfComponents.month == nowComponents.month) &&
            (selfComponents.day == nowComponents.day)
    }
    
    // MARK: 是否是昨天
    /// 是否是昨天
    /// - Returns: Bool
    public func isYesterday() -> Bool {
        if let nowDate = Date().dateWithYMD(), let selfDate = self.dateWithYMD() {
            let calendar = Calendar.current
            let components = (calendar as NSCalendar).components(.day, from: selfDate, to: nowDate, options: NSCalendar.Options.matchFirst)
            return components.day == 1
        }
        return false
    }
    
    // MARK: 是否是一周内
    /// 是否是一周内
    /// - Returns: Bool
    public func isInOneWeak() -> Bool {
        if let nowDate = Date().dateWithYMD(), let selfDate = self.dateWithYMD() {
            let calendar = Calendar.current
            let components = (calendar as NSCalendar).components(.day, from: selfDate, to: nowDate, options: NSCalendar.Options.matchFirst)
            return components.day! <= 7
        }
        return false
    }
    
    // MARK: 传入的日期是星期几
    /// 传入的日期是星期几
    /// - Returns: 星期几
    public func weakDayString() -> String? {
        let currentCalendar = Calendar.current
        let selfComponents = (currentCalendar as NSCalendar).components(.weekday, from: self)
        if let weekday = selfComponents.weekday {
            switch weekday {
            case 1:
            return "星期日"
            case 2:
            return "星期一"
            case 3:
            return "星期二"
            case 4:
            return "星期三"
            case 5:
            return "星期四"
            case 6:
            return "星期五"
            default:
                return "星期六"
            }
        }
        return nil
    }
    
    // MARK: 是否是今年
    /// 是否是今年
    /// - Returns: Bool
    public func isThisYear() -> Bool {
        let calendar = Calendar.current
        let nowComponents = (calendar as NSCalendar).components(.year, from: Date())
        let selfComponents = (calendar as NSCalendar).components(.year, from: self)
        return nowComponents.year == selfComponents.year
    }
    
    // MARK: 以传入的时区转换当前时区
    ///  以传入的时区转换当前时区
    /// - Returns: DateComponents
    public func deltaWithNow() -> DateComponents {
        let calendar = Calendar.current
        return (calendar as NSCalendar).components([.hour, .minute, .second], from: self, to: Date(), options: .matchFirst)
    }
    
    // MARK: 以当前时区转换传入的时区
    ///  以当前时区转换传入的时区
    /// - Returns: DateComponents
    public func deltaToNow() -> DateComponents {
        let calendar = Calendar.current
        return (calendar as NSCalendar).components([.day, .hour, .minute, .second], from: Date(), to: self, options: .matchFirst)
    }
    
    // MARK: 时间标准格式化
    ///  时间标准格式化 yyyy-MM-dd HH:mm:ss
    /// - Returns: yyyy-MM-dd HH:mm:ss
    public func dateWithYMD() -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let selfString = formatter.string(from: self)
        return formatter.date(from: selfString)
    }
    
    public func isEqualDayToDate(_ date:Date) -> Bool {
        let flags: NSCalendar.Unit = [.year, .month, .day]
        let components = (Calendar.current as NSCalendar).components(flags, from: self)
        let componentsAnotherDate = (Calendar.current as NSCalendar).components(flags, from: date)
        if components.year == componentsAnotherDate.year &&
            components.month == componentsAnotherDate.month &&
            components.day == componentsAnotherDate.day {
            return true
        }
        return false
    }
    
    public func isGreatedDayToDate(_ date:Date) -> Bool {
        let flags: NSCalendar.Unit = [.year, .month, .day]
        let components = (Calendar.current as NSCalendar).components(flags, from: self)
        let componentsAnotherDate = (Calendar.current as NSCalendar).components(flags, from: date)
        if components.year! > componentsAnotherDate.year! {
            return true
        }
        if components.year == componentsAnotherDate.year &&
            components.month! > componentsAnotherDate.month! {
            return true
        }
        if components.year == componentsAnotherDate.year &&
            components.month == componentsAnotherDate.month &&
            components.day! > componentsAnotherDate.day! {
            return true
        }
        return false
    }
    
    public func isGreatedTimeToTime(_ date:Date) -> Bool {
        let flags: NSCalendar.Unit = [.hour, .minute]
        let components = (Calendar.current as NSCalendar).components(flags, from: self)
        let componentsAnotherDate = (Calendar.current as NSCalendar).components(flags, from: date)
        if components.hour! > componentsAnotherDate.hour! {
            return true
        }
        if components.hour == componentsAnotherDate.hour &&
            components.minute! >= componentsAnotherDate.minute! {
            return true
        }
        return false
    }

    public func isEqualMonthToDate(_ date:Date) -> Bool {
        let flags: NSCalendar.Unit = [.year, .month]
        let components = (Calendar.current as NSCalendar).components(flags, from: self)
        let componentsAnotherDate = (Calendar.current as NSCalendar).components(flags, from: date)
        if components.year == componentsAnotherDate.year &&
            components.month == componentsAnotherDate.month {
            return true
        }
        
        return false
    }
    
    public func monthDiffToDate(_ date:Date) -> Int {
        let flags: NSCalendar.Unit = [.month, .day]
        let components = (Calendar.current as NSCalendar).components(flags, from: self, to: date, options: NSCalendar.Options.wrapComponents)
        if var month = components.month {
            if let day = components.day {
                if day > 0 {
                    month += 1
                    return month
                }
            }
        }
        return 0
    }
    
    public func addYear(_ year:Int) -> Date {
        var dateComponents = DateComponents()
        dateComponents.year = year
        
        let newDate = (Calendar.current as NSCalendar).date(byAdding: dateComponents, to: self, options: NSCalendar.Options())
        return newDate!
    }
    
    public func addMonth(_ months:Int) -> Date {
        var dateComponents = DateComponents()
        dateComponents.month = months
        
        let newDate = (Calendar.current as NSCalendar).date(byAdding: dateComponents, to: self, options: NSCalendar.Options())
        return newDate!
    }
    
    public func addDay(_ days:Int) -> Date {
        var dateComponents = DateComponents()
        dateComponents.day = days
        
        let newDate = (Calendar.current as NSCalendar).date(byAdding: dateComponents, to: self, options: NSCalendar.Options())
        return newDate!
    }
}
