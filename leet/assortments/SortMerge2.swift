//
//  SortMerge2.swift
//  leet
//
//  Created by Hoan Tran on 8/8/17.
//  Copyright © 2017 Pego Consulting. All rights reserved.
//

import Foundation

class SortMerge2 {
    var arr = Int.getRandomArray(size: 10, max: 100)
    
    func merge(left: Int, mid: Int, right: Int) {
        if left >= right {
            return
        }
        
        let slice = self.arr[left...right]
        let copy = Array(slice)
        
        var walker = left
        let leftLimit = mid - left
        let rightLimit = right - left + 1
        var i = 0
        var j = leftLimit
        
        while i < leftLimit && j < rightLimit {
            if copy[i] < copy[j] {
                self.arr[walker] = copy[i]
                i += 1
            } else {
                self.arr[walker] = copy[j]
                j += 1
            }
            walker += 1
        }
        
        while i < leftLimit {
            self.arr[walker] = copy[i]
            i += 1
            walker += 1
        }
        
        while j < rightLimit {
            self.arr[walker] = copy[j]
            j += 1
            walker += 1
        }
    }
    
    func sort(left: Int, right: Int) {
        if left >= right {
            return
        }
        
        let diff = right - left
        let mid = left + (diff/2) + (diff%2)
        
        sort(left: left, right: mid-1)
        sort(left: mid, right: right)
        
        print(left, " : ", mid, " : ", right)
        merge(left: left, mid: mid, right: right)
    }
    
    
    static func run() {
        let merger = SortMerge2()
        
        print(merger.arr)
        print(Int.isNonDecreasing(arr: merger.arr))
        
        merger.sort(left: 0, right: merger.arr.count-1)
        
        print(merger.arr)
        print(Int.isNonDecreasing(arr: merger.arr))
    }
}
