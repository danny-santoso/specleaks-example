//
//  DelegateTests.swift
//  specleaks-exampleTests
//
//  Created by danny.santoso on 03/04/22.
//

import Nimble
import Quick
import SpecLeaks

@testable import specleaks_example

class DelegatesTests: QuickSpec {
    
    override func spec() {
        describe("a NotLeakingClient") {
            
            it("must not leak"){
                
                let test = LeakTest{
                    return NotLeakingClient(server: NotLeakingServer())
                }
                
                expect(test).toNot(leak())
            }
        }
        
        describe("a LeakingClient") {
            
            it("must leak"){
                
                let test = LeakTest{
                    return LeakingClient(server: LeakingServer())
                }
                
                expect(test).to(leak())
            }
        }
    }
}
