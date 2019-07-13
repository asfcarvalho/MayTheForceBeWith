//
//  MayTheForceBeWith_AndersonUITests.swift
//  MayTheForceBeWith_AndersonUITests
//
//  Created by Anderson F Carvalho on 10/07/19.
//  Copyright © 2019 asfcarvalho. All rights reserved.
//

import XCTest

class MayTheForceBeWith_AndersonUITests: XCTestCase {
    var app: XCUIApplication!

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        
        app = XCUIApplication()

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testeGoingToPersonView() {
        app.launch()
        
        XCTAssertTrue(app.isDisplayingListPerson)
        app/*@START_MENU_TOKEN@*/.tables.staticTexts["R2-D2"]/*[[".otherElements[\"listPersonView\"].tables",".cells.staticTexts[\"R2-D2\"]",".staticTexts[\"R2-D2\"]",".tables"],[[[-1,3,1],[-1,0,1]],[[-1,2],[-1,1]]],[0,0]]@END_MENU_TOKEN@*/.tap()
        XCTAssertTrue(app.isDisplayingPerson)
        app.navigationBars["Person"].buttons["People"].tap()
        XCTAssertFalse(app.isDisplayingPerson)
    }
    
    func testeGoingToPersonAndFavoriting() {
        app.launch()
        
        XCTAssertTrue(app.isDisplayingListPerson)
        app/*@START_MENU_TOKEN@*/.tables.staticTexts["R2-D2"]/*[[".otherElements[\"listPersonView\"].tables",".cells.staticTexts[\"R2-D2\"]",".staticTexts[\"R2-D2\"]",".tables"],[[[-1,3,1],[-1,0,1]],[[-1,2],[-1,1]]],[0,0]]@END_MENU_TOKEN@*/.tap()
        XCTAssertTrue(app.isDisplayingPerson)
        app/*@START_MENU_TOKEN@*/.scrollViews/*[[".otherElements[\"personView\"].scrollViews",".scrollViews"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.otherElements.staticTexts["Favorite"].tap()
        sleep(5)
        XCTAssertTrue(app.isFavoriting)
    }

    func testSearchBar() {
        
        app.launch()
        
        XCTAssertTrue(app.isDisplayingListPerson)
        app.otherElements["listPersonView"].children(matching: .other).element.children(matching: .searchField).element.tap()
        
        app.otherElements["listPersonView"].children(matching: .other).element.children(matching: .searchField).element.tap()
        
        let eKey = app.keys["E"]
        eKey.tap()
        let moreKey = app/*@START_MENU_TOKEN@*/.keys["more"]/*[[".keyboards",".keys[\"more, numbers\"]",".keys[\"more\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/
        moreKey.tap()
        let key = app/*@START_MENU_TOKEN@*/.keys["2"]/*[[".keyboards.keys[\"2\"]",".keys[\"2\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        key.tap()
        app/*@START_MENU_TOKEN@*/.buttons["Search"]/*[[".keyboards.buttons[\"Search\"]",".buttons[\"Search\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app/*@START_MENU_TOKEN@*/.searchFields/*[[".otherElements[\"listPersonView\"].searchFields",".searchFields"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.buttons["Clear text"].tap()
        
    }

}

extension XCUIApplication {
    var isDisplayingListPerson: Bool {
        return otherElements["listPersonView"].exists
    }
    
    var isDisplayingPerson: Bool {
        return otherElements["personView"].exists
    }
    
    var isFavoriting: Bool {
        return otherElements["favoriting"].exists
    }
}
