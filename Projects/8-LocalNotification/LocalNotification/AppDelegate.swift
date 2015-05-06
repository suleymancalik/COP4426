//
//  AppDelegate.swift
//  LocalNotification
//
//  Created by Suleyman Calik on 06/05/15.
//  Copyright (c) 2015 BAU. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {

        UIApplication.sharedApplication().applicationIconBadgeNumber = 0
        
        var types:UIUserNotificationType = .Badge | .Sound | .Alert
        var settings = UIUserNotificationSettings(forTypes:types , categories:nil)
        UIApplication.sharedApplication().registerUserNotificationSettings(settings)
        
        return true
    }
    

    
    func application(application: UIApplication, didReceiveLocalNotification notification: UILocalNotification) {
        
        var alert = UIAlertView(title:"Hapı YUT", message:"", delegate:nil, cancelButtonTitle:"Tamam")
        alert.show()
    }


}








