//
//  CodeCoverageTests.swift
//  CodeCoverageTests
//
//  Created by wj on 15/11/7.
//  Copyright © 2015年 wj. All rights reserved.
//

import XCTest
@testable import CodeCoverage

class CodeCoverageTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testEqualOneCharacterStrings(){
       XCTAssert(checkWord("1", isAnagramOfWord: "1"))
    }
    
    func testDifferentLengthStrings(){
        XCTAssertFalse(checkWord("a", isAnagramOfWord: "bb"))
    }
    
    func testEmptyStrings() {
        XCTAssert(checkWord("", isAnagramOfWord: ""))
    }
    
    func testLongAnagram() {
        XCTAssert(checkWord("chris grant", isAnagramOfWord: "char string"))
    }
    
    func testLongInvalidAnagramWithEqualLengths() {
        XCTAssertFalse(checkWord("apple", isAnagramOfWord: "tests"))
    }
}
