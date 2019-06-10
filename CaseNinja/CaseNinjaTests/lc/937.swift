//
//  937.swift
//  CaseNinjaTests
//
//  Created by Manas Johri on 10/06/19.
//  Copyright © 2019 Manas Johri. All rights reserved.
//

import XCTest

/*
 
 You have an array of logs.  Each log is a space delimited string of words.
 
 For each log, the first word in each log is an alphanumeric identifier.  Then, either:
 
 Each word after the identifier will consist only of lowercase letters, or;
 Each word after the identifier will consist only of digits.
 We will call these two varieties of logs letter-logs and digit-logs.  It is guaranteed that each log has at least one word after its identifier.
 
 Reorder the logs so that all of the letter-logs come before any digit-log.  The letter-logs are ordered lexicographically ignoring identifier, with the identifier used in case of ties.  The digit-logs should be put in their original order.
 
 Return the final order of the logs.
 
 Example 1:
 
 Input: ["a1 9 2 3 1","g1 act car","zo4 4 7","ab1 off key dog","a8 act zoo"]
 Output: ["g1 act car","a8 act zoo","ab1 off key dog","a1 9 2 3 1","zo4 4 7"]
 
 Note:
 
 0 <= logs.length <= 100
 3 <= logs[i].length <= 100
 logs[i] is guaranteed to have an identifier, and a word after the identifier.
 
 */

class _937: XCTestCase {
    
    func testO() {
        
        struct Log {
            
            private(set) var org: String
            var main: Substring = ""
            var id: Substring = ""
            var isInt = false
            
            init(_ str: String) {
                self.org = str
                let splits = org.split(separator: " ")
                self.id = splits[0]
                self.main = org.suffix(org.count-(id.count+1))
                self.isInt = Int(String(self.main.first!)) != nil
            }
        }
        
        func reorderLogFiles(_ logs: [String]) -> [String] {
            
            var cLogs = logs.map {Log($0)}
            
            cLogs.sort { (i1,i2) -> Bool in
                if !i1.isInt && !i2.isInt {
                    return i1.main==i2.main ?i1.id<i2.id:i1.main<i2.main
                }
                return !i1.isInt
            }
            
            return cLogs.map{$0.org}
        }
        
        let input = ["a1 9 2 3 1","g1 act car","zo4 4 7","ab1 off key dog","a8 act zoo","a2 act car"]
        let output = ["a2 act car","g1 act car","a8 act zoo","ab1 off key dog","a1 9 2 3 1","zo4 4 7"]
        let result = reorderLogFiles(input)
        XCTAssert(result==output)
    }
}

