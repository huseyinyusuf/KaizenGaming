//
//  SportModelTest.swift
//  KaizenGamingAssignmentTests
//
//  Created by Huseyin Yusuf on 5/6/23.
//

import XCTest

fileprivate struct Constants {
    static let sportId = "FOOT"
    static let sportName = "FOOTBALL"
    static let events = [
        Event(json: event1Json),
        Event(json: event2Json)
    ]

    static let event1Json: JSON = ["i":"32836151",
                                  "si":"FOOT",
                                  "d":"Macnhester United - Barcelona",
                                  "tt":1679347020
    ]
    
    static let event2Json: JSON = ["i":"32836155",
                                  "si":"FOOT",
                                  "d":"Juventus - Real Madrid",
                                  "tt":1679347060
    ]
    
    static let sportJson: JSON = ["i":"FOOT",
                                  "d":"FOOTBALL",
                                  "e": [
                                    event1Json,
                                    event2Json
                                  ]
    ]
}

class SportModelTest: XCTestCase {
    
    func testSportInitializer() {
        let sport = Sport(json: Constants.sportJson)
        XCTAssertEqual(sport.sportId, Constants.sportId, "Sport ID is not initialized correctly")
        XCTAssertEqual(sport.sportName, Constants.sportName, "Sport name is not initialized correctly")
        XCTAssertEqual(sport.events.count, 2, "Sport events count does not match")
        
        // Event1
        let event1 = sport.events[0]
        XCTAssertEqual(event1.eventId, Constants.events[0].eventId, "Event ID is not initialized correctly")
        XCTAssertEqual(event1.sportId, Constants.events[0].sportId, "Event sport ID is not initialized correctly")
        XCTAssertEqual(event1.startTime, Constants.events[0].startTime, "Event startTime(tt) is not initialized correctly")
        XCTAssertEqual(event1.competitor1, Constants.events[0].competitor1, "Event competitor1 is not initialized correctly")
        XCTAssertEqual(event1.competitor2, Constants.events[0].competitor2, "Event competitor2 is not initialized correctly")
        // Event2
        let event2 = sport.events[1]
        XCTAssertEqual(event2.eventId, Constants.events[1].eventId, "Event ID is not initialized correctly")
        XCTAssertEqual(event2.sportId, Constants.events[1].sportId, "Event sport ID is not initialized correctly")
        XCTAssertEqual(event2.startTime, Constants.events[1].startTime, "Event startTime(tt) is not initialized correctly")
        XCTAssertEqual(event2.competitor1, Constants.events[1].competitor1, "Event competitor1 is not initialized correctly")
        XCTAssertEqual(event2.competitor2, Constants.events[1].competitor2, "Event competitor2 is not initialized correctly")
    }

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
