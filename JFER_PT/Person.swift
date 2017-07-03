//
//  Person.swift
//  JFER_PT
//
//  Created by Jose Ferre on 3/7/17.
//  Copyright © 2017 JFER. All rights reserved.
//

import Foundation

struct Person: CustomStringConvertible {
    
    enum rolType: Int {
        case father = 1
        case mother = 2
        case son = 3
    }
    
    var name: String
    var age: Int
    var rol: rolType
    var description: String {
        return "Me llamo \(name), tengo \(age) años y soy \(rolTypeToString())"
    }
    
    private func rolTypeToString() -> String {
        
        switch self.rol {
        case .father: return "padre"
        case .mother: return "madre"
        case .son: return "hijo"
        }
    }
}
