//
//  UtilitiesNimbleTest.swift
//  CodeQualityTests
//
//  Created by Ghouse Basha Shaik on 12/01/18.
//  Copyright © 2018 Ghouse Basha Shaik. All rights reserved.
//
/*
QUICK AND NIBBLE

 IT EXAMPLE
 Defined with the it function, use assertions to demonstrate how code should behave. These are like "tests" in XCTest.
 */

import Quick
import Nimble
import XCTest
@testable import CodeQuality

class UtilitiesNimbleTest: QuickSpec {
    
    override func spec() {
        // Unit Case for validating Text with max length
        // Rule : Can't be empty and length not lesser than maxlength
        describe("ValidateText") {
            it("Negative Test, by providing empty input", closure: {
                //expect(Utilities.validate(text: "", maxLength: 6)).to(equal(false))
                expect(Utilities.validate(text: "", maxLength: 6)) == false
            })
            it("Negative Test, by providing improper input With MaxLength of 8", closure: {
                expect(Utilities.validate(text: "vsofm", maxLength: 8)).to(equal(false))
            })
            it("Positive Test, by providing valid input With MaxLength of 8", closure: {
                expect(Utilities.validate(text: "vsoftteam", maxLength: 8)).to(equal(true))
            })
        }
        
        // Unit Case for validating ZIPCODE/PHONE OR ONLY NUMBERS
        // Rule : Can't be empty and length must be maxlength
        describe("ValidateNumber") {
            it("Negative Test, by providing empty input", closure: {
                expect(Utilities.validateNumber(number: "", maxLength: 6)).to(equal(false))
            })
            it("Negative Test, by providing improper input With MaxLength of 8", closure: {
                expect(Utilities.validateNumber(number: "123456", maxLength: 8)).to(equal(false))
            })
            it("Positive Test, by providing valid zipcode With MaxLength of 6", closure: {
                expect(Utilities.validateNumber(number: "560016", maxLength: 6)).to(equal(true))
            })
        }
        
        // Unit Case for validating EMail
        // Rule : Can't be empty and following Top level domain syntax
        describe("ValidateEMail") {
            it("Negative Test, by providing email without topleveldomain", closure: {
                expect(Utilities.isValid(email: "vsoft")).to(equal(false))
            })
            it("Negative Test, by providing incomplete email topleveldomain", closure: {
                expect(Utilities.isValid(email: "mobileteam@vsoft")).to(equal(false))
            })
            it("Positive Test, by providing proper email id", closure: {
                expect(Utilities.isValid(email: "mobileteam@vsoft.com")).to(equal(true))
            })
        }
        
        // Unit Case for validating PASSWORD
        /* Rules : length more than or equal 8, lowercase, uppercase, decimal Digits, and speical character $@$!%*?& */
        describe("ValidatePassword") {
            it("Negative Test, by providing improper password, noSepecialCharasNoDigits", closure: {
                expect(Utilities.isValid(password: "mobile", maxLength: 5)).to(equal(false))
            })
            it("Negative Test, by providing improper password, noSepecialCharas", closure: {
                expect(Utilities.isValid(password: "moBile", maxLength: 6)).to(equal(false))
            })
            it("Negative Test, by providing improper password, noMaxLength", closure: {
                expect(Utilities.isValid(password: "M0V@s", maxLength: 6)).to(equal(false))
            })
            it("Positive Test, by providing proper password", closure: {
                expect(Utilities.isValid(password: "M0BileV@ost", maxLength: 8)).to(equal(true))
            })
        }
        
        // Unit Case for validating PASSWORD and CONFRIM PASSWORD
        /* Rules : length more than or equal 8, lowercase, uppercase, decimal Digits, and speical character $@$!%*?& */
        describe("ValidatePasswordConfirmPassword") {
            it("Negative Test, by providing improperPasswordandConfirm", closure: {
                expect(Utilities.isBothPasswordSame(password: "MoBile", confirmPassword: "TeamMates")).to(equal(false))
            })
            it("Positive Test, by providing valide password and confirm password", closure: {
                expect(Utilities.isBothPasswordSame(password: "M0BileV@ost", confirmPassword: "M0BileV@ost")).to(equal(true))
            })
        }
    }
    
}
