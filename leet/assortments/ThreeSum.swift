//
//  ThreeSum.swift
//  leet1
//
//  Created by Hoan Tran on 2/7/17.
//  Copyright © 2017 Pego Consulting. All rights reserved.
//

import Foundation

class ThreeSum {
    func order(_ triplet: [Int]) -> [Int] {
        if triplet.count != 3 {
            return triplet
        }
        
        var a, b, c, s: Int
        a = triplet[0]
        b = triplet[1]
        c = triplet[2]
        s = 0
        
        if b < a {
            s=a
            a=b
            b=s
        }
        if c < a {
            s=a
            a=c
            c=s
        }
        if c < b {
            s=b
            b=c
            c=s
        }
        
        return [a, b, c]
    }
    
    
    func threeSum(_ nums: [Int]) -> [[Int]] {
        if nums.count < 3 {
            return []
        }
        
        var sol = [[Int]]()
        
        for (aIndex, a) in nums.enumerated() {
            for (bIndex, b) in nums.enumerated() {
                if aIndex != bIndex {
                    for (cIndex, c) in nums.enumerated() {
                        if cIndex != bIndex && cIndex != aIndex {
                            if a + b + c == 0 {
                                sol.append([a,b,c])
                            }
                        }
                    }
                }
            }
        }
        
        if sol.count < 1 {
            return []
        }
        
        for (i,_) in sol.enumerated() {
            sol[i].sort()
            //            var s: Int
            //
            //            if sol[i][1] < sol[i][0] {
            //                s=sol[i][0]
            //                sol[i][0]=sol[i][1]
            //                sol[i][1]=s
            //            }
            //            if sol[i][2] < sol[i][0] {
            //                s=sol[i][0]
            //                sol[i][0]=sol[i][2]
            //                sol[i][2]=s
            //            }
            //            if sol[i][2] < sol[i][1] {
            //                s=sol[i][1]
            //                sol[i][1]=sol[i][2]
            //                sol[i][2]=s
            //            }
            
            
            
            //            sol[i] = order(x)
        }
        
        //        numbers.sort {
        //            return $0 < $1
        //        }
        
        var star = [[Int]]()
        star.append(sol[0])
        
        sol.remove(at: 0)
        for questionable in sol {
            var isNew = true
            for s in star {
                if questionable[0] == s[0] && questionable[1] == s[1] && questionable[2] == s[2] {
                    isNew = false
                    break
                }
            }
            if isNew {
                star.append(questionable)
            }
        }
        
        return star
    }
    
    static func run() {
        let run = ThreeSum()
        //let f = run.threeSum([-1, 0, 1, 2, -1, -4])
        //let f = run.threeSum([-1,0,1,2,-1,-4])
        let f = run.threeSum([0,7,-4,-7,0,14,-6,-4,-12,11,4,9,7,4,-10,8,10,5,4,14,6,0,-9,5,6,6,-11,1,-8,-1,2,-1,13,5,-1,-2,4,9,9,-1,-3,-1,-7,11,10,-2,-4,5,10,-15,-4,-6,-8,2,14,13,-7,11,-9,-8,-13,0,-1,-15,-10,13,-2,1,-1,-15,7,3,-9,7,-1,-14,-10,2,6,8,-6,-12,-13,1,-3,8,-9,-2,4,-2,-3,6,5,11,6,11,10,12,-11,-14])
        
        //let f = run.threeSum([])
        //let f = run.threeSum([0,1,1])
        for x in f {
            print (x)
        }
    }
}



