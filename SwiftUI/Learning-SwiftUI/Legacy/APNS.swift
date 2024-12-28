//
//  APNS.swift
//  Learning
//
//  Created by  whatsup on 2024/10/29.
//

import Foundation
import UserNotifications

struct APNS {
//    Your company’s server, known as the provider server
//    Apple Push Notification service (APNs)
//    The user’s device
//    Your app running on the user’s device
    
//    The device token that identifies the user device to receive the notification; refer to Registering your app with APNs.
//    Your current authentication token (only if you’re using token-based authentication); refer to Establishing a token-based connection to APNs.
    
    // apns  1. Xcode里 target里开启 push notification配置
    //       2. 获取deviceToken 给remote端 remote 拿着auth key去生成 base64的token 有时效性 auth key没有时效性
    //       3. 注册authorization权限 处理接收消息
    //       4. 远端 拿着device token 和 在Apple生产的Apple auth key 去生产token 加上需要发送的payload 发送给user
    
    let center = UNUserNotificationCenter.current()
    
    // 获取推送权限
    func initFunc() async {
        do {
            try await center.requestAuthorization(options: [.alert, .sound, .badge, .provisional])
        } catch {
            // Handle errors that may occur during requestAuthorization.
        }
    }
    
    // 每次处理推送都要check promise
    func checkStatus() async {
        let settings = await center.notificationSettings()

        // Verify the authorization status.
        guard (settings.authorizationStatus == .authorized) ||
              (settings.authorizationStatus == .provisional) else { return }


        if settings.alertSetting == .enabled {
            // Schedule an alert-only notification.
        } else {
            // Schedule a notification with a badge and sound.
        }
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                didReceive response: UNNotificationResponse,
                withCompletionHandler completionHandler: @escaping () -> Void) {
       // Get the meeting ID from the original notification.
       let userInfo = response.notification.request.content.userInfo
            
       if response.notification.request.content.categoryIdentifier ==
                  "MEETING_INVITATION" {
          // Retrieve the meeting details.
          let meetingID = userInfo["MEETING_ID"] as! String
          let userID = userInfo["USER_ID"] as! String
                
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
    
    func userNotificationCenter(_ center: UNUserNotificationCenter,
             willPresent notification: UNNotification,
             withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
       if notification.request.content.categoryIdentifier ==
                "MEETING_INVITATION" {
          // Retrieve the meeting details.
          let meetingID = notification.request.content.userInfo["MEETING_ID"] as! String
          let userID = notification.request.content.userInfo["USER_ID"] as! String
                
          // Add the meeting to the queue.
//          sharedMeetingManager.queueMeetingForDelivery(user: userID,
//                meetingID: meetingID)


          // Play a sound to let the user know about the invitation.
          completionHandler(.sound)
          return
       }
       else {
          // Handle other notification types...
       }


       // Don't alert the user for other types.
       completionHandler(UNNotificationPresentationOptions(rawValue: 0))
    }
    
}
