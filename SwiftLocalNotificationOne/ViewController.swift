//
//  ViewController.swift
//  SwiftLocalNotificationOne
//
//  Created by NextDot on 1/31/16.
//  Copyright © 2016 RzRasel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func sysBtnOnClickNotifyMe(sender: AnyObject) {
        let settings = UIApplication.sharedApplication().currentUserNotificationSettings()
        
        if settings!.types == .None {
            let alertController = UIAlertController(title: "Can't schedule", message: "Either we don't have permission to schedule notifications, or we haven't asked yet.", preferredStyle: .Alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
            presentViewController(alertController, animated: true, completion: nil)
            //return
        }
        let currDate = NSDate();
        let dateComp = NSDateComponents();
        dateComp.second = 10;
        
        let cal = NSCalendar.currentCalendar();
        let fireDate: NSDate = cal.dateByAddingComponents(dateComp, toDate: currDate, options: NSCalendarOptions(rawValue: 0))!;
        
        let notification: UILocalNotification = UILocalNotification();
        notification.alertTitle = "Rz Local Notification"
        notification.alertBody = "This is a local notification";
        notification.alertAction = "Be Awesome!"
        notification.soundName = UILocalNotificationDefaultSoundName
        notification.fireDate = fireDate;
        UIApplication.sharedApplication().scheduleLocalNotification(notification);
    }
}