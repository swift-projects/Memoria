//
//  NSDateExntentions.swift
//  Memoria
//
//  Created by Matan Cohen on 2/13/16.
//  Copyright © 2016 MACMatan. All rights reserved.
//

import Foundation
import UIKit

extension NSDate {
    
    func secoundsAgoFromDate(date : NSDate)->NSInteger {
        let calendar = NSCalendar.currentCalendar()
        let unitFlags = NSCalendarUnit.Second
        let earliest = self.earlierDate(date)
        let latest = (earliest == self) ? date : self
        let components:NSDateComponents = calendar.components(unitFlags, fromDate: earliest, toDate: latest, options: NSCalendarOptions.WrapComponents)
        
        return components.second
    }
    
    func yearsFrom(date:NSDate) -> Int{
        return NSCalendar.currentCalendar().components(.Year, fromDate: date, toDate: self, options: []).year
    }
    func monthsFrom(date:NSDate) -> Int{
        return NSCalendar.currentCalendar().components(.Month, fromDate: date, toDate: self, options: []).month
    }
    func weeksFrom(date:NSDate) -> Int{
        return NSCalendar.currentCalendar().components(.WeekOfYear, fromDate: date, toDate: self, options: []).weekOfYear
    }
    func daysFrom(date:NSDate) -> Int{
        return NSCalendar.currentCalendar().components(.Day, fromDate: date, toDate: self, options: []).day
    }
    func hoursFrom(date:NSDate) -> Int{
        return NSCalendar.currentCalendar().components(.Hour, fromDate: date, toDate: self, options: []).hour
    }
    func minutesFrom(date:NSDate) -> Int{
        return NSCalendar.currentCalendar().components(.Minute, fromDate: date, toDate: self, options: []).minute
    }
    func secondsFrom(date:NSDate) -> Int{
        return NSCalendar.currentCalendar().components(.Second, fromDate: date, toDate: self, options: []).second
    }
    
    func isInThePast()->Bool {
        return NSDate() > self
    }
    
    func isInTheFuture()->Bool {
        return NSDate() < self
    }
    
    func toStringWithCurrentRegion()-> String {
        let formatter = NSDateFormatter()
        formatter.dateFormat = "yyyy/MM/dd-hh:mm:ss"
        formatter.locale =  NSLocale.currentLocale()
        let formattedDateString = formatter.stringFromDate(self)
    
        return formattedDateString
    }
    
    func toStringCurrentRegionShortTime()->String {
        let formatter = NSDateFormatter()
        formatter.dateFormat = "h:mm a"
        formatter.AMSymbol = "AM"
        formatter.PMSymbol = "PM"
        formatter.locale = NSLocale.currentLocale()
        
        let dateString = formatter.stringFromDate(self)
        return dateString    // "3:11 AM
    }
    
        func isGreaterThanDate(dateToCompare: NSDate) -> Bool {
            //Declare Variables
            var isGreater = false
            
            //Compare Values
            if self.compare(dateToCompare) == NSComparisonResult.OrderedDescending {
                isGreater = true
            }
            
            //Return Result
            return isGreater
        }
        
        func isLessThanDate(dateToCompare: NSDate) -> Bool {
            //Declare Variables
            var isLess = false
            
            //Compare Values
            if self.compare(dateToCompare) == NSComparisonResult.OrderedAscending {
                isLess = true
            }
            
            //Return Result
            return isLess
        }
        
        func equalToDate(dateToCompare: NSDate) -> Bool {
            //Declare Variables
            var isEqualTo = false
            
            //Compare Values
            if self.compare(dateToCompare) == NSComparisonResult.OrderedSame {
                isEqualTo = true
            }
            
            //Return Result
            return isEqualTo
        }
        
        func addDays(daysToAdd: Int) -> NSDate {
            let secondsInDays: NSTimeInterval = Double(daysToAdd) * 60 * 60 * 24
            let dateWithDaysAdded: NSDate = self.dateByAddingTimeInterval(secondsInDays)
            
            //Return Result
            return dateWithDaysAdded
        }
        
        func addHours(hoursToAdd: Int) -> NSDate {
            let secondsInHours: NSTimeInterval = Double(hoursToAdd) * 60 * 60
            let dateWithHoursAdded: NSDate = self.dateByAddingTimeInterval(secondsInHours)
            
            //Return Result
            return dateWithHoursAdded
        }
    
    
    func dateToDayPartDeifinisionString()->String {
        let morningStartTime = 0
        let morningEndTime = 12
        let afterNoonStartTime = 12
        let afterNoonEndTime = 18
        let eaviningStartTime = 18
        let eaviningEndTime = 25
        
        if (self.hour >= morningStartTime && self.hour <= morningEndTime) {
            return Content.getContent(ContentType.LabelTxt, name: "TimeOfDayMorining")
        }
        if (self.hour >= afterNoonStartTime && self.hour <= afterNoonEndTime) {
            return Content.getContent(ContentType.LabelTxt, name: "TimeOfDayAfterNoon")
        }
        if (self.hour >= eaviningStartTime && self.hour <= eaviningEndTime) {
            return Content.getContent(ContentType.LabelTxt, name: "TimeOfDayEavning")
        }
        
        return "There is no time definision"
    }
}
