//
//  SortMerge.swift
//  leet1
//
//  Created by Hoan Tran on 6/14/17.
//  Copyright © 2017 Pego Consulting. All rights reserved.
//

import Foundation

class SortMerge {
    static func sort(_ set: inout [Int], start: Int, mid: Int, end: Int) {
//        print(mid)
        if( start < end ) {
            let p1 = start
            let q1 = mid - 1
            let c1 = (p1+q1)/2 + 1
            SortMerge.sort(&set, start: p1, mid: c1, end: q1)
            SortMerge.members(set, start: p1, end: q1)

            let p2 = mid
            let q2 = end
            let c2 = (p2+q2)/2 + 1
            SortMerge.sort(&set, start: p2, mid: c2, end: q2)
            SortMerge.members(set, start: p2, end: q2)
            
            self.merge(&set, start: p1, mid: mid, end: q2)
        }
    }
    
    static func members(_ set: [Int], start: Int, end: Int) {
//        print ("[", terminator: " ")
//        for i in start...end {
//            print("\(set[i])", terminator: ", ")
//        }
//        print("]")
    }
    
    static func merge(_ set: inout [Int], start: Int, mid: Int, end: Int) {
//        print("MERGE: ", terminator: " ")
        
        let slice = set[start...end]
        let buff = Array(slice)
        
        var l = 0
        var r = mid - start
        let c = r
        
        for i in 0...buff.count-1 {
            if l >= c {
                set [i + start] = buff [r]
                r += 1
            } else if r > buff.count - 1 {
                set [i + start] = buff[l]
                l += 1
            } else if buff[l] > buff[r] {
                set[i + start] = buff[r]
                r += 1
            } else {
                set[i + start] = buff[l]
                l += 1
            }
        }
        
        self.members(set, start: start, end: end)

//        print(" ")
        
    }
    
    static func run() {
//        var sample = [ 1, ]
        var sample = [ 1, 7, 2, 10, 5, 4 ]
        print (sample)
        
        var mid:Int = sample.count - 1
        mid /= 2
        mid += 1
        
        SortMerge.sort(&sample, start: 0, mid: mid, end: sample.count-1)
        print(sample)
        print()
    }
}
