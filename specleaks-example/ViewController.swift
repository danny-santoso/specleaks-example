//
//  ViewController.swift
//  specleaks-example
//
//  Created by danny.santoso on 03/04/22.
//

import RxSwift
import UIKit

class ViewController: UIViewController {
    
    private var anyObject : AnyObject? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func cleanLeakedObjects(){
        
        self.anyObject = nil
    }
    
    func createLeak(){
        self.anyObject = self
    }
    
    func doSomething(){
        print("doing something")
    }
    
    func createLeakInBlock() -> () -> (){
        return {
            self.doSomething()
        }
    }
    
    func dontCreateLeakInBlock() -> () -> (){
        return { [weak self] in
            self?.doSomething()
        }
    }
    
    func createLeakInFlatMap() -> Observable<String>{
        return Observable.just("hello")
            .flatMap { (hello) -> Observable<String> in
                self.doSomething()
                return .just("goodbye and leak")
            }
    }
    
    func dontCreateLeakInFlatMap() -> Observable<String>{
        return Observable.just("hello")
            .flatMap { [unowned self] (hello) -> Observable<String> in
                self.doSomething()
                return .just("goodbye")
            }
    }
    
}
