//
//  LicenseKeyFormatting.swift
//  leet
//
//  Created by Hoan Tran on 8/18/17.
//  Copyright © 2017 Pego Consulting. All rights reserved.
//

import Foundation

class LicenseKeyFormatting {
    
    func exe2(_ S: String, _ K: Int) -> String {
        var len: Int = 0
        
        for c in S {
            if c != "-" { len += 1 }
        }
        
        var groupCount: Int = len % K
        if groupCount == 0 {
            groupCount = K
        }
        
        var i = 0
        var result = ""
        
        for c in S {
            if c != "-" {
                let cap = (String (c)).uppercased()
                result += cap
                
                i += 1
                groupCount -= 1
                
                if groupCount == 0 {
                    if i < len {
                        result += "-"
                    }
                    groupCount = K
                }
            }
        }
        return result
    }
    
    func exe(_ S: String, _ K: Int) -> String {
        var justAlphaNumeric: String = ""
        
        for c in S {
            if c != "-" {
                justAlphaNumeric += (String (c)).uppercased()
            }
        }
        
        let charCount = justAlphaNumeric.count
        var firstGroupLen = charCount % K
        if firstGroupLen == 0 {
            firstGroupLen = K
        }
        
        var result: String = ""
        
        var offset = 0
        var len = firstGroupLen
        
        while offset < charCount {
            let startIndex = justAlphaNumeric.index ( justAlphaNumeric.startIndex, offsetBy: offset)
            let endIndex = justAlphaNumeric.index ( justAlphaNumeric.startIndex, offsetBy: offset + len)
            let range = startIndex ..< endIndex
//            result += justAlphaNumeric.substring(with: range)
            result += String(justAlphaNumeric[range])
            
            offset += len
            len = K
            
            if offset < charCount {
                result += "-"
            }
        }
        
        return result
    }
    
    static func run() {
        let input = "2-4A0r7-4k"
        let K = 3
        
        let formatting = LicenseKeyFormatting()
        print(formatting.exe(input, K))
        print(formatting.exe2(input, K))
    }
}
