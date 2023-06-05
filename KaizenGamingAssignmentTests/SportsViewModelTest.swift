//
//  SportsViewModelTest.swift
//  KaizenGamingAssignmentTests
//
//  Created by Huseyin Yusuf on 5/6/23.
//

import XCTest

class SportsViewModelTest: XCTestCase {
    var vm: SportsViewModel?
    let fetchDataExpectation = XCTestExpectation(description: "Fetched data from Internet")
    
    func testInitFromInternet() {
        guard let vm = vm else { return }
        let sportCount = vm.numberOfSections()
        XCTAssertNotEqual(sportCount, 0, "Number of sports must be greater then 0 after fetcghing from internet")
    }
    
    func testUpdateEventFavourite() {
        let firstEventOfFirstSport = vm?.getSportWithSection(section: 0)?.events[0]
        XCTAssertEqual(firstEventOfFirstSport?.isFavourite, false, "Initial isFavourite value of first event should be false")
        vm?.updateEventFavourite(event: firstEventOfFirstSport)
        let updatedEvent = vm?.getSportWithSection(section: 0)?.events[0]
        XCTAssertEqual(updatedEvent?.isFavourite, true, "Update isFavourite value of first event should be true")
    }

    // This is called before each test method
    override func setUpWithError() throws {
        vm = SportsViewModel(delegate: self)
        let expectations = [
            fetchDataExpectation,
        ]
        wait(for: expectations, timeout: 10.0)
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

// MARK: Delegate Helper
extension SportsViewModelTest: ViewModelDelegate {
    
    func shouldReloadTableView() {
        fetchDataExpectation.fulfill()
    }
    
    
}
