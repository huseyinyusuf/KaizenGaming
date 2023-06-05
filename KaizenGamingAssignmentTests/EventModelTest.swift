//
//  EventModelTest.swift
//  KaizenGamingAssignmentTests
//
//  Created by Huseyin Yusuf on 5/6/23.
//

import XCTest

fileprivate struct Constants {
    static let eventId = "32836151"
    static let eventSportId = "FOOT"
    static let eventTT: Int64 = 1679347020
    static let competitor1 = "Macnhester United"
    static let competitor2 = "Barcelona"
    static let isFavourite = false

    static let json: JSON = [
        "i":"32836151",
        "si":"FOOT",
        "d":"Macnhester United - Barcelona",
        "tt":1679347020
    ]
}

class EventModelTest: XCTestCase {
    
    func testInit() {
        let event = Event(json:Constants.json)
        XCTAssertEqual(event.eventId, Constants.eventId, "Event ID is not initialized correctly")
        XCTAssertEqual(event.sportId, Constants.eventSportId, "Event sport ID is not initialized correctly")
        XCTAssertEqual(event.startTime, Constants.eventTT, "Event startTime(tt) is not initialized correctly")
        XCTAssertEqual(event.isFavourite, Constants.isFavourite, "Event isFavourite is not initialized correctly")
        XCTAssertEqual(event.competitor1, Constants.competitor1, "Event competitor1 is not initialized correctly")
        XCTAssertEqual(event.competitor2, Constants.competitor2, "Event competitor2 is not initialized correctly")
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
