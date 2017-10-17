//
//  Utilities.swift
//  leet1
//
//  Created by Hoan Tran on 8/8/17.
//  Copyright © 2017 Pego Consulting. All rights reserved.
//

import Foundation

extension Int {
    static func getRandomArray(size: Int, max: UInt32 = UINT32_MAX) -> [Int] {
        var arr: [Int] = [Int]()
        
        for _ in 1...size {
            arr.append(Int(arc4random_uniform(max) ))
        }
        
        return arr;
    }
    
    static func isNonDecreasing(arr: [Int]) -> Bool {
        if arr.count > 1 {
            for i in 1...arr.count-1 {
                if arr[i] < arr[i-1] {
                    return false
                }
            }
        }
        
        return true
    }
}
