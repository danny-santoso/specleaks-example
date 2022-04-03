//
//  ObjectTests.swift
//  specleaks-exampleTests
//
//  Created by danny.santoso on 03/04/22.
//

import Nimble
import Quick
import SpecLeaks

@testable import specleaks_example

class SomeOjectTests: QuickSpec {
    override func spec() {
        describe("a SomeObject") {
            describe("init") {
                it("must leak"){
                    
                    let someObject = LeakTest{
                        return Office(unit: "Tokopedia Tower")
                    }
                    
                    let doSomethingIsCalled : (Office) -> ()  = {obj in obj.doSomething()}
                    
                    expect(someObject).to(leakWhen(doSomethingIsCalled))
                }
            }
        }
    }
}
