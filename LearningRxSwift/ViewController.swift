//
//  ViewController.swift
//  LearningRxSwift
//
//  Created by Alberto Moral on 5/9/16.
//  Copyright © 2016 Alberto Moral. All rights reserved.
//

import UIKit
import RxSwift

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let counter = Utilities.myInterval(0.001)
        
        print("Started -----")
        
        let subscription = counter.subscribeNext { n in
            print(n)
        }
        
        NSThread.sleepForTimeInterval(0.5)
        subscription.dispose()
        
        print("Ended -----")
    }
}

