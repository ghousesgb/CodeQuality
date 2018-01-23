//
//  CodeQualityTests.swift
//  CodeQualityTests
//
//  Created by Ghouse Basha Shaik on 12/01/18.
//  Copyright © 2018 Ghouse Basha Shaik. All rights reserved.
//

import XCTest
@testable import CodeQuality

class CodeQualityTests: XCTestCase {
    
    var calendar: Calendar?
    var locale: Locale?
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        calendar = Calendar(identifier: .gregorian)
        locale   = Locale(identifier: "en_US")
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        calendar = nil
        locale   = nil
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
