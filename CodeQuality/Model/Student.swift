//
//  Student.swift
//  CodeQuality
//
//  Created by Ghouse Basha Shaik on 29/01/18.
//  Copyright © 2018 Ghouse Basha Shaik. All rights reserved.
//

import Foundation

class Student {
    var name : String?
    var address : String?
    
    init() {}
    init(name : String, address: String) {
        self.name       =   name
        self.address    =   address
    }
}
