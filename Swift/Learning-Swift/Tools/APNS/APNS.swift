//
//  APNS.swift
//  Learning-Swift
//
//  Created by  whatsup on 2024/12/15.
//

import Foundation
import UserNotifications

class APNS: NSObject, UNUserNotificationCenterDelegate {
    
    let center = UNUserNotificationCenter.current()

    override init() {
        super.init()
        self.center.delegate = self
    }    

    func requestAuth() async -> Bool {
        do {
            return try await center.requestAuthorization(options: [.alert, .sound, .badge, .provisional])
        } catch {
            // Handle errors that may occur during requestAuthorization.
            return false
        }
    }
    
    func checkEnabling() async -> Bool {
        let settings = await center.notificationSettings()
        // Verify the authorization status.
        guard (settings.authorizationStatus == .authorized) ||
                (settings.authorizationStatus == .provisional) else {
            return false
        }
        return settings.alertSetting == .enabled
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                didReceive response: UNNotificationResponse,
                withCompletionHandler completionHandler:
                   @escaping () -> Void) {
       // Get the meeting ID from the original notification.
       let userInfo = response.notification.request.content.userInfo
            
       if response.notification.request.content.categoryIdentifier ==
                  "MEETING_INVITATION" {
          // Retrieve the meeting details.
//          let meetingID = userInfo["MEETING_ID"] as! String
//          let userID = userInfo["USER_ID"] as! String
                
          switch response.actionIdentifier {
          case "ACCEPT_ACTION":
//             sharedMeetingManager.acceptMeeting(user: userID,
//                   meetingID: meetingID)
             break
                    
          case "DECLINE_ACTION":
//             sharedMeetingManager.declineMeeting(user: userID,
//                   meetingID: meetingID)
             break
                    
          case UNNotificationDefaultActionIdentifier,
               UNNotificationDismissActionIdentifier:
             // Queue meeting-related notifications for later
             //  if the user does not act.
//             sharedMeetingManager.queueMeetingForDelivery(user: userID,
//                   meetingID: meetingID)
             break
                    
          default:
             break
          }
       }
       else {
          // Handle other notification types...
       }
            
       // Always call the completion handler when done.
       completionHandler()
    }
   
}
