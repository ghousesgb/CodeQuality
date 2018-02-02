//
//  UtilitiesTest.swift
//  CodeQualityTests
//
//  Created by Ghouse Basha Shaik on 12/01/18.
//  Copyright © 2018 Ghouse Basha Shaik. All rights reserved.
//

import XCTest
@testable import CodeQuality

class UtilitiesTest: XCTestCase {
    
    // Unit Case for validating Text with max length
    // Rule : Can't be empty and length not lesser than maxlength
    func test_validateText_isNotValid_emptyString() {
        XCTAssertEqual(Utilities.validate(text: "", maxLength: 0), false)
    }
    func test_validateText_isNotValid_lengthIssue() {
        XCTAssertEqual(Utilities.validate(text: "vsoftsdfsdf", maxLength: 10), false)
    }
    func test_validateText_isValid() {
        XCTAssertEqual(Utilities.validate(text: "vsoftte", maxLength: 8), true)
    }
    
    // Unit Case for validating ZIPCODE/PHONE OR ONLY NUMBERS
    // Rule : Can't be empty and length must be maxlength
    func test_validateNumber_isNotValid_lengthIssue() {
        XCTAssertEqual(Utilities.validateNumber(number: "11", maxLength: 8), false)
    }
    func test_validatePhone_isNotValid_onlyNumbersAllowed() {
        XCTAssertEqual(Utilities.validateNumber(number: "11333333432423423", maxLength: 8), false)
    }
    func test_validateZipCode_isValid() {
        XCTAssertEqual(Utilities.validateNumber(number: "560016", maxLength: 6), true)
    }
    func test_validatePhone_isValid() {
        XCTAssertEqual(Utilities.validateNumber(number: "9844993959", maxLength: 10), true)
    }
    
    // Unit Case for validating EMAIL ID
    func test_validateEmail_isNotValid_incompleteEmail_noTLD() {
        XCTAssertEqual(Utilities.isValid(email: "vsoft"), false)
    }
    func test_validateEmail_isNotValid_incompleteEmail_incompleteTLD() {
        XCTAssertEqual(Utilities.isValid(email: "mobileteam@vsoft"), false)
    }
    func test_validateEmail_isValid() {
        XCTAssertEqual(Utilities.isValid(email: "mobileteam@vsoftconsulting.com"), true)
    }
    
    // Unit Case for validating PASSWORD
    /* Rules : length more than or equal 8, lowercase, uppercase, decimal Digits, and speical character $@$!%*?& */
    func test_validatePassword_isNotValid_improperPassword_noSpecialCharsNoDigits() {
        XCTAssertEqual(Utilities.isValid(password: "mobile", maxLength: 6), false)
    }
    func test_validatePassword_isNotValid_inProperPassword_noSpecialChars() {
        XCTAssertEqual(Utilities.isValid(password: "moBile", maxLength: 6), false)
    }
    func test_validatePassword_isNotValid_inProperPassword_noMaxLength() {
        XCTAssertEqual(Utilities.isValid(password: "M0V@s", maxLength: 6), false)
    }
    func test_validatePassword_isValid() {
        XCTAssertEqual(Utilities.isValid(password: "M0BileV@ost", maxLength: 8), true)
    }
    
    // Unit Case for validating PASSWORD and CONFRIM PASSWORD
    /* Rules : length more than or equal 8, lowercase, uppercase, decimal Digits, and speical character $@$!%*?& */
    func test_validatePasswordConfirm_isNotValid_improperPasswordandConfirm() {
        XCTAssertEqual(Utilities.isBothPasswordSame(password: "MoBile", confirmPassword: "TeamMates"), false)
    }
    func test_validatePasswordConfirm_isValid() {
        XCTAssertEqual(Utilities.isBothPasswordSame(password: "M0BileV@ost", confirmPassword: "M0BileV@ost"), true)
    }
}
