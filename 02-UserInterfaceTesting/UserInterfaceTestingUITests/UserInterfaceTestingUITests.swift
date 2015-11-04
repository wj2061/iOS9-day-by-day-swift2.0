//
//  UserInterfaceTestingUITests.swift
//  UserInterfaceTestingUITests
//
//  Created by WJ on 15/11/4.
//  Copyright © 2015年 wj. All rights reserved.
//

import XCTest

class UserInterfaceTestingUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    
    func testTapViewDetailWhenSwitchIsOffDoesNothing(){
        
        let app = XCUIApplication()
        app.switches["View Detail Enabled Switch"].tap()
        app.buttons["View Detail"].tap()
        
        XCTAssertEqual(app.navigationBars.element.identifier, "Menu")
    }
    
    func testTapViewDetailWhenSwitchIsOnNavigatesToDetailViewController(){
        let app = XCUIApplication()
       app.buttons["View Detail"].tap()
        
        XCTAssertEqual(app.navigationBars.element.identifier, "Detail")
    }
    
    
    
    func testTapIncrementButtonIncrementsValueLabel(){
        
        let app = XCUIApplication()
        app.buttons["View Detail"].tap()
        
        let incrementButton = app.buttons["Increment Value"]
        let valueLabel = app.staticTexts["Number Value Label"]
        
        for index in 0...10{
            incrementButton.tap()
            XCTAssertEqual((valueLabel.value as! String), "\(index+1)")
        }
    }
  
}
