//
//  EightQueens.swift
//  leet1
//
//  Created by Hoan Tran on 2/7/17.
//  Copyright © 2017 Pego Consulting. All rights reserved.
//

import Foundation

struct Queen {
    let row: Int
    var col: Int
    
    init(_ row: Int) {
        self.row = row
        self.col = 0
    }
}

class EightQueens {
    var nFound = 0
    var queens = (0...7).map({Queen($0)})
    var nChecks = 0
    
    func showSolution(){
        print ("SOLUTION: \(self.nFound)")
        
        for (index,p) in self.queens.reversed().enumerated() {
            print(8-index, " ", terminator: "")
            for w in 0...7 {
                if w == p.col {
                    print("Q ", terminator: "")
                } else {
                    print("- ", terminator: "")
                }
            }
            print()
        }
        print("   ", terminator:"")
        for c in "ABCDEFGH".characters {
            print(c, "", terminator:"")
        }
        print("")
        print("")
    }
    
    func isSafe(_ curRow: Int, _ curCol: Int) -> Bool {
        self.nChecks += 1
        for prevRow in 0..<curRow {
            if self.queens[prevRow].col == curCol {
                return false
            }
            let diff = curRow - prevRow
            if  self.queens[prevRow].col == curCol - diff ||
                self.queens[prevRow].col == curCol + diff {
                return false
            }
        }
        
        return true
    }
    
    func moveQueenAcrossRow(_ row: Int) {
        for col in 0...7 {
            if isSafe(row, col) {
                self.queens[row].col = col
                if row == 7 {
                    self.nFound += 1
                    showSolution()
                } else {
                    moveQueenAcrossRow(row+1)
                }
            }
        }
    }
    
    static func run() {
        let t = EightQueens()
        t.moveQueenAcrossRow(0)
        print()
        print("Positions checked: \(t.nChecks)")
        
    }
}
