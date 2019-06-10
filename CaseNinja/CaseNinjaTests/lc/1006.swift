//
//  1006.swift
//  CaseNinjaTests
//
//  Created by Manas Johri on 04/04/19.
//  Copyright © 2019 Manas Johri. All rights reserved.
//

import XCTest

/*
 
 Normally, the factorial of a positive integer n is the product of all positive integers less than or equal to n.  For example, factorial(10) = 10 * 9 * 8 * 7 * 6 * 5 * 4 * 3 * 2 * 1.
 
 We instead make a clumsy factorial: using the integers in decreasing order, we swap out the multiply operations for a fixed rotation of operations: multiply (*), divide (/), add (+) and subtract (-) in this order.
 
 For example, clumsy(10) = 10 * 9 / 8 + 7 - 6 * 5 / 4 + 3 - 2 * 1.  However, these operations are still applied using the usual order of operations of arithmetic: we do all multiplication and division steps before any addition or subtraction steps, and multiplication and division steps are processed left to right.
 
 Additionally, the division that we use is floor division such that 10 * 9 / 8 equals 11.  This guarantees the result is an integer.
 
 Implement the clumsy function as defined above: given an integer N, it returns the clumsy factorial of N.
 
 
 
 Example 1:
 
 Input: 4
 Output: 7
 Explanation: 7 = 4 * 3 / 2 + 1
 Example 2:
 
 Input: 10
 Output: 12
 Explanation: 12 = 10 * 9 / 8 + 7 - 6 * 5 / 4 + 3 - 2 * 1
 
 
 Note:
 
 1 <= N <= 10000
 -2^31 <= answer <= 2^31 - 1  (The answer is guaranteed to fit within a 32-bit integer.)
 
 */

class _1006: XCTestCase {
    
    //o(1)
    func testConstantTime() {
        
        //1 time, pattern outline
        //5*4/3 + 2-1, 4*3/2 + 1
        //floor(10*9/8) + 7 - floor(6*5/4) + 3 - 2*1
        //floor(11*10/9) + 8 - floor(7*6/5) + 4 - 3*2/1
        //(13*12/11) + 10 - 9 * 8 / 7 + 6 - 5 * 4 / 3 + 2 - 1
        //%4:-2, %3:1, %2:1, %1:0
        
        self.measure {
            func clumsy(_ N: Int) -> Int {
                return N>4 ?(N+1) + [-2,0,1,1][(N-3)%4]:(N>0 && N<=4 ? [7,1,2,6][N%4]:0)
            }
            
            print(clumsy(12))
        }
    }
}

