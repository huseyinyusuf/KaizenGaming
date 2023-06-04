//
//  Sport.swift
//  KaizenGamingAssignment
//
//  Created by Huseyin Yusuf on 4/6/23.
//

struct Sport {
    var sportId: String
    var sportName: String
    var events: [Event] = []
    
    init(json: JSON) {
        self.sportId = json["i"] as? String ?? ""
        self.sportName = json["d"] as? String ?? ""
        let eventsJsonArray = json["e"] as? [JSON] ?? []
        for json in eventsJsonArray {
            let event = Event(json: json)
            self.events.append(event)
        }
    }
}
