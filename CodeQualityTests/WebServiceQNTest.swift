//
//  WebServiceQNTest.swift
//  CodeQualityTests
//
//  Created by Ghouse Basha Shaik on 16/01/18.
//  Copyright © 2018 Ghouse Basha Shaik. All rights reserved.

import Quick
import Nimble
import XCTest
@testable import CodeQuality

class WebServiceQNTest: QuickSpec {
    //HELPER VARIABLES AND METHODS
    let urlString = "https://kgitestserver.azurewebsites.net/token"

    func wwwFormURLEncodedHeader() -> [String : AnyObject]  {
        return ["Content-Type" : "application/x-www-form-urlencoded; charset=utf-8" as AnyObject]
    }
    
    func jsonDataFrom(jsonString : String) -> Data {
        return jsonString.data(using: String.Encoding.utf8)!
    }
    
    override func spec() {
        // Unit Case for validating API Calling
        // Rule : Providing only corrent username wrong password
        describe("ValidateLoginAPI_UsernamePassword") {
            it("Negative Test, Providing correct Username wrong Password", closure: {
                let jsonString = "username=larryblake&grant_type=password"
                let jsonData = self.jsonDataFrom(jsonString: jsonString)
                let headers : [String : AnyObject] = self.wwwFormURLEncodedHeader()
                let expectations = self.expectation(description: "API Call Waiting")

                WebServiceManager.makeAPICallsWith(urlString: self.urlString, methodName: "POST", headers: headers, httpBody: jsonData, successHandler: {json, response in
                    expect(response?.statusCode) == 400
                    expectations.fulfill()
                }, failureHandler:{ response, error in
                    
                })
                /// Wait for the async request to complete
                self.waitForExpectations(timeout: 60.0, handler:nil)
            })
        }
        
        // Unit Case for validating Text with max length
        // Rule : Can't be empty and length not lesser than maxlength
        describe("ValidateLoginAPI_UsernamePassword") {
            it("Negative Test, Providing correct Username correct Password", closure: {
                let jsonString = "username=larryblake&password=growers96&grant_type=password"
                let jsonData = self.jsonDataFrom(jsonString: jsonString)
                let headers : [String : AnyObject] = self.wwwFormURLEncodedHeader()
                let expectations = self.expectation(description: "API Call Waiting")

                WebServiceManager.makeAPICallsWith(urlString: self.urlString, methodName: "POST", headers: headers, httpBody: jsonData, successHandler: {json, response in
                    expect(response?.statusCode) == 200
                    expectations.fulfill()
                }, failureHandler:{ response, error in
                    
                })
                // Wait for the async request to complete
                self.waitForExpectations(timeout: 60.0, handler:nil)
            })
        }
    }
}
    

