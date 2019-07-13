//
//  PersonTests.swift
//  MayTheForceBeWith_AndersonTests
//
//  Created by Anderson F Carvalho on 13/07/2019.
//  Copyright © 2019 asfcarvalho. All rights reserved.
//

import XCTest
@testable import MayTheForceBeWith_Anderson

class PersonTests: XCTestCase {
    
    var presenter = PeoplePresenter()
    var dataManager: PeopleDataManagerInputProtocol = PeopleDataManager()
    let mockDataManagerOutput = MockDataManagerOutput()
    
    class MockDataManagerOutput: PeopleDataManagerOutputProtocol {
        
        var isFavorite: Bool?
        var error: String?
        
        func onSuccess() {
            isFavorite = true
        }
        
        func onError(_ message: String) {
            error = message
        }
        
        
    }

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
        
        presenter.dataManager = dataManager
        dataManager.presenter = mockDataManagerOutput
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testFavorite() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        presenter.setFavorite()
        
        sleep(5)
        
        XCTAssertEqual(mockDataManagerOutput.isFavorite ?? false, true)
    }
    
    

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
