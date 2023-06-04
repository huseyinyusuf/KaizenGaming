//
//  Event.swift
//  KaizenGamingAssignment
//
//  Created by Huseyin Yusuf on 4/6/23.
//

struct Event {
    var eventId: String
    var sportId: String
    var competitor1: String
    var competitor2: String
    var startTime: Int64
    var isFavourite: Bool
    
    init(json: JSON) {
        self.eventId = json["i"] as? String ?? ""
        self.sportId = json["si"] as? String ?? ""
        
        let eventName = json["d"] as? String ?? ""
        let trimmedEventName = eventName.trimmingCharacters(in: .whitespacesAndNewlines)
        let eventNameArray = trimmedEventName.components(separatedBy: "-")
        self.competitor1 = eventNameArray[0]
        self.competitor2 = eventNameArray[1]
        self.startTime = json["tt"] as? Int64 ?? 0
        self.isFavourite = false
    }
}
