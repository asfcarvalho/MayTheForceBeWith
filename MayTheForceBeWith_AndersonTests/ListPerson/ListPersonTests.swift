//
//  ListPersonTests.swift
//  MayTheForceBeWith_AndersonTests
//
//  Created by Anderson F Carvalho on 13/07/2019.
//  Copyright © 2019 asfcarvalho. All rights reserved.
//

import XCTest
@testable import MayTheForceBeWith_Anderson

class ListPersonTests: XCTestCase {
    
    var presenter = ListPersonPresenter()
    var dataManager: ListPersonDataManagerInputProtocol = ListPersonDataManager()
    let mockDataManagerOutput = MockDataManagerOutput()

    override func setUp() {
        super.setUp()
        
        presenter.dataManager = dataManager
        dataManager.presenter = mockDataManagerOutput
    }

    override func tearDown() {
        super.tearDown()
    }

    func testListPerson() {
        
        presenter.getListPerson(nil)
        
        sleep(5)
    XCTAssertGreaterThan(mockDataManagerOutput.people?.count ?? 0, 0)
        
    }
    
    func testListPersonFalse() {
        presenter.getListPerson(nil)
        
        sleep(5)
        XCTAssertGreaterThan(mockDataManagerOutput.people?.count ?? 0, 0)
        XCTAssertFalse(mockDataManagerOutput.people?.people?.contains(where: { (item) -> Bool in
            return item.name == "R2-D3"
        }) ?? false)
    }
    
    class MockDataManagerOutput: ListPersonDataManagerOutputProtocol {
        
        var people: ListPerson?
        var error: String?
        
        func onSuccess(_ people: ListPerson?) {
            self.people = people
            
        }
        
        func onError(_ message: String) {
            self.error = message
            
        }
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            presenter.getListPerson(nil)
        }
    }

}
