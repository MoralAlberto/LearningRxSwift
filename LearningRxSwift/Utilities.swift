//
//  Utilities.swift
//  LearningRxSwift
//
//  Created by Alberto Moral on 6/9/16.
//  Copyright © 2016 Alberto Moral. All rights reserved.
//

import Foundation
import RxSwift

class Utilities {
    
    func exampleOne() {
        let schedule = MainScheduler.asyncInstance
        Observable<Int>.interval(0.3, scheduler: schedule)
            .observeOn(MainScheduler.asyncInstance)
            .subscribe { event in
                print(event)
        }
    }

    static func exampleTwo() {
        let stringCounter = Utilities.myForm(["First", "Second"])
        print("Started ----")
        
        stringCounter.subscribeNext { n in
            print(n)
        }
        
        print("----")
        
        stringCounter.subscribeNext { n in
            print(n)
        }
        
        print("Ended ----")
    }
    
    
    // MARK: Private
    
    private static func myForm<E>(sequence: [E]) -> Observable<E> {
        return Observable.create { observer in
            for element in sequence {
                observer.on(.Next(element))
            }
            
            observer.on(.Completed)
            return NopDisposable.instance
        }
    }
    
    private static func myInterval(interval: NSTimeInterval) -> Observable<Int> {
        
    }
}