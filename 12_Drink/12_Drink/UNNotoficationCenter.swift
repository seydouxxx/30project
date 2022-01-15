//
//  UNNotoficationCenter.swift
//  12_Drink
//
//  Created by Seydoux on 2021/11/24.
//

import Foundation
import UserNotifications

extension UNUserNotificationCenter {
    func addNotificationRequest(by alert: Alert) {
        print("test")
        let content = UNMutableNotificationContent()
        
        content.title = "물 마실 시간이예요💦"
        content.body = "세계보건기구(WHO)가 권장하는 하루 물 섭취량은 1.5~2리터 입니다."
        content.sound = .default
        content.badge = 1
        
        print(Calendar.current.dateComponents([.hour, .minute], from: alert.date))
        print(alert.isOn)
        print(alert.id)
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: Calendar.current.dateComponents([.hour, .minute], from: alert.date), repeats: alert.isOn)

        let request = UNNotificationRequest(identifier: alert.id, content: content, trigger: trigger)
        
        self.add(request, withCompletionHandler: nil)
    }
}
