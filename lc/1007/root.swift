//
//  Buffer.swift
//  MacMetalTests
//
//  Created by Manas Johri on 18/03/19.
//  Copyright © 2019 Manas Johri. All rights reserved.
//

import XCTest

class MasterSolver: XCTestCase {
    
    func testClumsyFact() {
        
        func clumsy(_ N: Int) -> Int {
            
            var num = N
            var odx = 0, rst: Double = Double(num)
            while num>1 {
                let prev = num-1
                
                switch odx%4 {
                    
                case 0:
                    rst = (rst*Double(prev))
                    
                case 1:
                    rst = floor(rst/Double(prev))
                    
                case 2:
                    rst += Double(prev)
                    
                case 3:
                    rst -= floor(Double(prev*(prev-1>0 ?prev-1:1)/(prev-2>0 ?prev-2:1)))
                    num = prev-2
                    odx += 3
                    continue
                    
                default:
                    break
                }
                
                num = prev
                odx += 1
            }
            
            return Int(round(rst))
        }
        
        print(clumsy(10))
    }
}

