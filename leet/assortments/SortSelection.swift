//
//  SortSelection.swift
//  leet1
//
//  Created by Hoan Tran on 4/11/17.
//  Copyright © 2017 Pego Consulting. All rights reserved.
//
// a study in selection sort
import Foundation


class SortSelection {
    static func sort(_ set: inout [Int]) {
        if set.count > 1 {
            var specialIndex: Int = 0
            var specialValue: Int = set[0]
            
            for special in 0...(set.count - 1) {
                specialValue = set[special]
                specialIndex = special
                for i in special...(set.count - 1) {
                    if set[i] < specialValue {
                        specialValue = set[i]
                        specialIndex = i
                    }
                }
                // swap
                set[specialIndex] = set[special]
                set[special] = specialValue
            }
        }
    }
    
    static func run() {
        var sample = [ 3, 1, 7, 2 ]
        print (sample)
        SortSelection.sort(&sample)
        print(sample)
    }
}
