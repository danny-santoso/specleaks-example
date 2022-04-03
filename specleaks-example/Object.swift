//
//  Object.swift
//  specleaks-example
//
//  Created by danny.santoso on 03/04/22.
//

import Foundation

class Person {
    let name: String
    init(name: String) { self.name = name }
    var tower: Office?
    deinit { print("\(name) is being deinitialized") }
}

class Office {
    let unit: String
    init(unit: String) { self.unit = unit }
    var employee: Person?
    deinit { print("\(unit) is being deinitialized") }
    
    func doSomething(){
        let nakama = Person(name: "Danny Santoso")
        nakama.tower = self
        self.employee = nakama
    }
}
