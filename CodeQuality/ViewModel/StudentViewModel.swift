//
//  StudentViewModel.swift
//  CodeQuality
//
//  Created by Ghouse Basha Shaik on 29/01/18.
//  Copyright © 2018 Ghouse Basha Shaik. All rights reserved.
//

import Foundation

class StudentViewModel {
    
    var reloadStudentTableView = {() -> () in}
    
    var arrayOfStudent : [Student] = [] {
        didSet {
            reloadStudentTableView()
        }
    }
    
    func addStudentRecordWith(name: String?, address: String?) {
        arrayOfStudent.append(Student(name: name!, address: address!))
    }
    
    func numberOfRowsInSection(section: Int) -> Int {
        return arrayOfStudent.count
    }
    
    func studentCellForRowAt(indexPath: IndexPath) -> Student {
        return arrayOfStudent[indexPath.row]
    }
    
    
}
