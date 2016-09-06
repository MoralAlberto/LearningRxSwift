//
//  ViewController.swift
//  LearningRxSwift
//
//  Created by Alberto Moral on 5/9/16.
//  Copyright © 2016 Alberto Moral. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let schedule = MainScheduler.asyncInstance
        
        Observable<Int>.interval(0.3, scheduler: schedule)
            .observeOn(MainScheduler.asyncInstance)
            .subscribe { event in
            print(event)
        }
        
//        NSThread.sleepForTimeInterval(2)
        
//        subscription.dispose()
    }
}

