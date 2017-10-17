//
//  FriendCircle.swift
//  leet1
//
//  Created by Hoan Tran on 8/18/17.
//  Copyright © 2017 Pego Consulting. All rights reserved.
//

import Foundation

// https://leetcode.com/problems/friend-circles/discuss/

// there is a better way to do it
// this solution is incomplete
class FriendCircle {
    func findCircleNum(_ M: [[Int]]) -> Int {
        let len = M.count
        if len < 2 {
            return len
        }
        
        var count = 0
        var marked = Array(repeating: false, count: len)
        
        let maxIndex = len - 1
        for i in 0...maxIndex {
            if marked[i] == false {
                count += 1
                marked[i] = true
                for j in i...maxIndex {
                    if j != i && M[i][j] != 0 {
                        marked[j] = true
                        for z in j...maxIndex {
                            if z != j && M[j][z] != 0 {
                                marked[z] = true
                            }
                        }
                    }
                }
            }
        }
        
        return count
    }
}
