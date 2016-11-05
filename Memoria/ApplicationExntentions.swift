//
//  ApplicationExntentions.swift
//  Memoria
//
//  Created by Matan Cohen on 09/10/2016.
//  Copyright © 2016 MACMatan. All rights reserved.
//

import Foundation
import UIKit
import UserNotifications

enum LocalNotificationCategotry: String {
    case notification = "notification"
    case warning = "warning"
    case verification = "verification"
    case done = "done"
}

extension UIApplication {
    static var bacgkroundTaskIdentifer: UIBackgroundTaskIdentifier?
    static func isApplicationActive()->Bool {
        return UIApplication.shared.applicationState == UIApplicationState.active
    }
    
    static func showLocalNotification(title: String, subtitle: String, body: String, localNotificationCategory: LocalNotificationCategotry) {
        self.showLocalNotification(title: title, subtitle: subtitle, body: body, localNotificationCategory: localNotificationCategory, date: nil)
    }
    
    static func showLocalNotification(title: String, subtitle: String, body: String, localNotificationCategory: LocalNotificationCategotry, date: Date?) {
        self.showLocalNotification(title: title, subtitle: subtitle, body: body, localNotificationCategory: localNotificationCategory, date: date, userInfo: nil)
    }
    
    static func showLocalNotification(title: String, subtitle: String, body: String, localNotificationCategory: LocalNotificationCategotry, date: Date?, userInfo: [String: Any]?) {
        let content = UNMutableNotificationContent()
        content.title = title
        content.subtitle = subtitle
        content.body = body
        content.sound = UNNotificationSound.default()
        content.categoryIdentifier = localNotificationCategory.rawValue
        if let isUserInfo = userInfo {
            content.userInfo = isUserInfo
        }
        let fireTimeInterval = (date != nil) ? date!.timeIntervalSinceNow : TimeInterval(0.01)
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: fireTimeInterval, repeats: false)
        let requestIdentifier = "TheCodeNinja_Identifier"
        let request = UNNotificationRequest(identifier: requestIdentifier, content: content,trigger: trigger)
        UNUserNotificationCenter.current().add(request) { (error) in
            if let isError = error {
                print("Error on notification reuqest = \(isError)")
            }
        }
    }
}
