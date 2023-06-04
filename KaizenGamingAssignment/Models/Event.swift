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
    var startTime: String
    
    init(json: JSON) {
        self.eventId = ""
        self.sportId = ""
        self.competitor1 = ""
        self.competitor2 = ""
        self.startTime = ""
    }
}
