//
//  StudentTest.swift
//  CodeQualityTests
//
//  Created by Ghouse Basha Shaik on 29/01/18.
//  Copyright © 2018 Ghouse Basha Shaik. All rights reserved.
//

import XCTest
@testable import CodeQuality

class StudentTest: XCTestCase {
        // Unit Case for fetching Movies titles
        // Rule : Can't be empty and length not lesser than maxlength
        func test_StudentTest_isValid() {
            let studentVM = StudentViewModel()
            studentVM.addStudentRecordWith(name: "Anu", address: "11/1 main bazar")
            studentVM.addStudentRecordWith(name: "Balu", address: "22/2 main bazar")
            studentVM.addStudentRecordWith(name: "Caisy", address: "33/3 main bazar")
            studentVM.addStudentRecordWith(name: "Dennis", address: "44/4 main bazar")
            
            XCTAssertEqual(studentVM.arrayOfStudent.count, 4)
            XCTAssertEqual(studentVM.arrayOfStudent[1].name, "Balu")
            XCTAssertEqual(studentVM.arrayOfStudent[1].name, "Caisy")
        }
}
