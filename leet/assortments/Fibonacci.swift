//
//  Fibonacci.swift
//  leet1
//
//  Created by Hoan Tran on 2/8/17.
//  Copyright © 2017 Pego Consulting. All rights reserved.
//

import Foundation

class Fibonacci {
    static func f(_ n: Int)->Int {
        if n == 0 || n == 1 {
            return 1
        } else if n > 1 {
            return f(n-1) + f(n-2)
        }
        return 0
    }
    
    static func run() {
        _ = (0...15).map({i in
            print("f(\(i)) = \(Fibonacci.f(i))")
        })
    }
    
}
