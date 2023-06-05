//
//  CountDown.swift
//  KaizenGamingAssignment
//
//  Created by Huseyin Yusuf on 5/6/23.
//
import Foundation

class Countdown {
    static let shared = Countdown()
    
    func getCountdownStringFromTT(eventStartTime: Int64) -> String {
        let calendar = Calendar.current
        // Set Current Date
        let curentDate = Date()
        // Set Event Date
        let eventDate = Date(timeIntervalSince1970: TimeInterval(eventStartTime))
        
        // Change the seconds to days, hours, minutes and seconds
        let timeLeft = calendar.dateComponents([.hour, .minute, .second], from: curentDate, to: eventDate)
        
        guard let minutes = timeLeft.minute,
              let hours = timeLeft.hour,
              let seconds = timeLeft.second else { return "" }
        
        if (hours <= 0 &&
            minutes <= 0 &&
            seconds <= 0) {
            return "LIVE"
        }
        
        let formatedString = String(format: "%d:%02d:%02d", arguments: [hours, minutes, seconds])
        
        return formatedString

    }
    
}
