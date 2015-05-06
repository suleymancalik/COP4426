//
//  ViewController.swift
//  LocalNotification
//
//  Created by Suleyman Calik on 06/05/15.
//  Copyright (c) 2015 BAU. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    func getNotificationCount() -> Int {
        var notificationCount = 0
        if let notifications = UIApplication.sharedApplication().scheduledLocalNotifications {
            notificationCount = notifications.count
        }
        
        return notificationCount
    }
    
    func showScheduledNotificationCount() {
        
        var notificationCount = getNotificationCount()
        
        var alert = UIAlertView(title:"Bekleyen Notification", message:"\(notificationCount)", delegate:nil, cancelButtonTitle:"OK")
        alert.show()
    }

    
    @IBAction func showNotifications(sender: UIButton) {
        showScheduledNotificationCount()
    }

    @IBAction func setNewNotification(sender: UIButton) {
        
        var minutes = sender.tag
        var seconds = NSTimeInterval(minutes * 60)
        
        var notification = UILocalNotification()
        notification.alertBody = "Hapı Yutmayı Unutma!"
        
        notification.applicationIconBadgeNumber = getNotificationCount() + 1

        var now = NSDate()
        notification.fireDate = now.dateByAddingTimeInterval(seconds)
        
        UIApplication.sharedApplication().scheduleLocalNotification(notification)
    }
    

}















