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
    
    static func myInterval(interval: NSTimeInterval) -> Observable<Int> {
        return Observable.create { observer in
            print("Subscribed")
            
            let queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
            let timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue)
            
            var next = 0
            
            dispatch_source_set_timer(timer, 0, UInt64(interval * Double(NSEC_PER_SEC)), 0)
            let cancel = AnonymousDisposable {
                print("Disposed")
                dispatch_source_cancel(timer)
            }
            dispatch_source_set_event_handler(timer, {
                if cancel.disposed {
                    return
                }
                observer.on(.Next(next))
                next += 1
            })
            
            dispatch_resume(timer)
            
            return cancel
        }
    }
}