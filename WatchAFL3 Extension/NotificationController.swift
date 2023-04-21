//
//  NotificationController.swift
//  WatchAFL3-0706012110031-Nuzulul Salsabila Watch App
//
//  Created by Nuzulul Salsabila on 21/04/23.
//

import WatchKit
import SwiftUI
import UserNotifications

class NotificationController: WKUserNotificationHostingController<NotificationView> {
    //store values about an incoming notification
    var landmark: Landmark?
    var title: String?
    var message: String?
    //to extract the landmark index from the notification
    let landmarkIndexKey = "landmarkIndex"
    
    override var body: NotificationView {
        //instantiates the notification view
        NotificationView(
            title: title,
            message: message,
            landmark: landmark
        )
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    // updates the controller’s properties
    override func didReceive(_ notification: UNNotification) {
        let modelData = ModelData()
        
        let notificationData =
        notification.request.content.userInfo as? [String: Any]
        
        let aps = notificationData?["aps"] as? [String: Any]
        let alert = aps?["alert"] as? [String: Any]
        
        title = alert?["title"] as? String
        message = alert?["body"] as? String
        
        if let index = notificationData?[landmarkIndexKey] as? Int {
            landmark = modelData.landmarks[index]
        }
    }
}
