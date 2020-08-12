
//
//  UIDate+Extension.swift
//  test
//
//  Created by codeLocker on 2019/8/19.
//  Copyright © 2019 codeLocker. All rights reserved.
//

import Foundation
import UIKit

//Formatter
extension Date {
    //当前的日历
    static let es_calendar: Calendar = Calendar.current
    static let es_calendar_chinese: Calendar = Calendar.init(identifier: .chinese)
    static let es_days_chinese: [String] = ["初一", "初二", "初三", "初四", "初五", "初六", "初七", "初八", "初九", "初十","十一", "十二", "十三", "十四", "十五", "十六", "十七", "十八", "十九", "二十", "廿一", "廿二", "廿三", "廿四", "廿五", "廿六", "廿七", "廿八", "廿九", "三十"]
    static let es_months_chinese: [String] = ["正月", "二月", "三月", "四月", "五月", "六月", "七月", "八月","九月", "十月", "冬月", "腊月"]
    
    

    
    func es_string(formatter: String) -> String {
        var formatter = formatter
        if formatter.isEmpty {
            formatter = "yyyy-MM-dd HH:mm:ss"
        }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = formatter
        return dateFormatter.string(from: self)
    }
    
    static func es_date(for dateStr: String, formatter: String) -> Date? {
        if dateStr.isEmpty {
            return nil
        }
        var formatter = formatter
        if formatter.isEmpty {
            formatter = "yyyy-MM-dd HH:mm:ss"
        }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = formatter
        return dateFormatter.date(from: dateStr)
    }
}

//Components
extension Date {
    var es_year: Int {
        get {
            return Date.es_calendar.component(.year, from: self)
        }
    }
    
    var es_month: Int {
        get {
            return Date.es_calendar.component(.month, from: self)
        }
    }
    
    var es_month_chinese: String {
        get {
            let day = Date.es_calendar_chinese.component(.month, from: self)
            return Date.es_days_chinese[day - 1]
        }
    }
    
    var es_day: Int {
        get {
            return Date.es_calendar.component(.day, from: self)
        }
    }
    
    var es_day_chinese: String {
        get {
            let day = Date.es_calendar_chinese.component(.day, from: self)
            return Date.es_days_chinese[day - 1]
        }
    }
    
    
    var es_hour: Int {
        get {
            return Date.es_calendar.component(.hour, from: self)
        }
    }
    
    var es_minute: Int {
        get {
            return Date.es_calendar.component(.minute, from: self)
        }
    }
    
    var es_second: Int {
        get {
            return Date.es_calendar.component(.second, from: self)
        }
    }
    
    //1:星期日 2:星期一 3:星期二 4:星期三 5:星期四 6:星期五 7:星期六
    var es_weekday: Int {
        get {
            return Date.es_calendar.component(.weekday, from: self)
        }
    }
    
    //1:星期一 2:星期二 3:星期三 4:星期四 5:星期五 6:星期六 7:星期日
    var es_weekday_chinese: Int {
        get {
            return self.es_weekday == 1 ? 7 : (self.es_weekday - 1)
        }
    }
    
    func es_set(value: Int, forUnit unit: Calendar.Component) -> Date? {
        let value = (value < 0) ? 0 : value
        var components = Date.es_calendar.dateComponents(Set.init(arrayLiteral: .year, .month, .day, .hour, .minute, .second), from: self)
        components.setValue(value, for: unit)
        return Date.es_calendar.date(from: components)
    }
    
    func es_setDay(_ day: Int) -> Date? {
        return self.es_set(value: day, forUnit: .day)
    }
    
    func es_setHour(_ hour: Int) -> Date? {
        return self.es_set(value: hour, forUnit: .hour)
    }
    
    func es_setMinute(_ minute: Int) -> Date? {
        return self.es_set(value: minute, forUnit: .minute)
    }
    
    func es_setSecond(_ second: Int) -> Date? {
        return self.es_set(value: second, forUnit: .second)
    }
    
    func es_addDay(_ day: Int) -> Date? {
        if day == 0 {
            return self
        }
        var components = DateComponents()
        components.day = day
        return Date.es_calendar.date(byAdding: components, to: self)
    }
    
    func es_subtractDay(_ day: Int) -> Date? {
        if day == 0 {
            return self
        }
        var components = DateComponents()
        components.day = -day
        return Date.es_calendar.date(byAdding: components, to: self)
    }
    
    func es_addMonth(_ month: Int) -> Date? {
        if month == 0 {
            return self
        }
        var components = DateComponents()
        components.month = month
        return Date.es_calendar.date(byAdding: components, to: self)
    }
    
    func es_subtractMonth(_ month: Int) -> Date? {
        if month == 0 {
            return self
        }
        var components = DateComponents()
        components.month = -month
        return Date.es_calendar.date(byAdding: components, to: self)
    }
    
}

//Functions
extension Date {
     static func es_dayCountInMonth(_ month: Date?) -> Int {
        guard let month = month else {
            return 0
        }
        
        guard let range = Date.es_calendar.range(of: .day, in: .month, for: month) else {
            return 0
        }
        return range.count
    }
    
    enum ESWeekdayStyle {
        case international
        case chinese
    }
    
    func es_weekdayOfMonthFirstDay(style: ESWeekdayStyle) -> Int {
        guard let date = self.es_setDay(1) else { return 0}
        switch style {
        case .international:
            return date.es_weekday
        case .chinese:
            return date.es_weekday_chinese
        }
    }
    
    func es_isSameDay(_ date: Date) -> Bool {
        return self.es_year == date.es_year && self.es_month == date.es_month && self.es_day == date.es_day
    }
}

//Festival
extension Date {
    static let festival: [String: String] = ["": "元旦", "": "腊八节", "": "大寒", "": "小年", "": "除夕", "": "春节", "": "立春", "情人节": "", "": "雨水", "": "惊蛰", "": "妇女节", "": "植树节", "": "春分", "": "愚人节", "": "寒食节", "": "清明节", "": "谷雨", "": "复活节", "": "劳动节", "": "青年节", "": "小满", "": "儿童节", "": "芒种", "": "端午节", "": "夏至", "": "建党节", "": "小暑", "": "大暑", "": "建军节", "": "立秋", "": "中元节", "": "处暑", "": "白露", "": "中秋节", "": "教师节", "": "秋分", "": "国庆节", "": "寒露", "": "重阳节", "": "霜降", "": "万圣节", "": "立冬", "": "小雪", "": "感恩节", "": "大雪", "": "冬至", "": "平安夜", "": "圣诞节"]
}
