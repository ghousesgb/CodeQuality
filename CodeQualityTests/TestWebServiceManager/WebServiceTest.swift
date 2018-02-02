//
//  WebServiceTest.swift
//  CodeQualityTests
//
//  Created by Ghouse Basha Shaik on 16/01/18.
//  Copyright © 2018 Ghouse Basha Shaik. All rights reserved.
//

import XCTest
@testable import CodeQuality

class WebServiceTest: XCTestCase {
    let urlString = "https://kgitestserver.azurewebsites.net/token"
    
    func wwwFormURLEncodedHeader() -> [String : AnyObject]  {
        return ["Content-Type" : "application/x-www-form-urlencoded; charset=utf-8" as AnyObject]
    }
    
    func jsonDataFrom(jsonString : String) -> Data {
        return jsonString.data(using: String.Encoding.utf8)!
    }
    
    func test_LoginAPI_isNotValid_noPasswordProvided() {
        
        let jsonString = "username=larryblake&grant_type=password"
        let jsonData = jsonDataFrom(jsonString: jsonString)
        let headers : [String : AnyObject] = wwwFormURLEncodedHeader()
        let expectations = self.expectation(description: "API Call Waiting")

        WebServiceManager.makeAPICallsWith(urlString: urlString, methodName: "POST", headers: headers, httpBody: jsonData, successHandler: {json, response in
            XCTAssertEqual(response?.statusCode, 400)
            expectations.fulfill()
        }, failureHandler:{ response, error in
            XCTFail("Failed API Call")
        })
        // Wait for the async request to complete
        waitForExpectations(timeout: 60.0, handler:nil)
    }
    
    func test_LoginAPI_isValid() {
        let jsonString = "username=larryblake&password=growers96&grant_type=password"
        let jsonData = jsonDataFrom(jsonString: jsonString)
        let headers : [String : AnyObject] = ["Content-Type" : "application/x-www-form-urlencoded; charset=utf-8" as AnyObject]
        let expectations = self.expectation(description: "API Call Waiting")

        WebServiceManager.makeAPICallsWith(urlString: urlString, methodName: "POST", headers: headers, httpBody: jsonData, successHandler: {json, response in
            XCTAssertEqual(response?.statusCode, 200)
            expectations.fulfill()
        }, failureHandler:{ response, error in
            XCTFail("Failed API Call")
        })
        // Wait for the async request to complete
        waitForExpectations(timeout: 60.0, handler:nil)
    }
}
