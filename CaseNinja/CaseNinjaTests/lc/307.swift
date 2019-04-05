//
//  307.swift
//  CaseNinjaTests
//
//  Created by Manas Johri on 05/04/19.
//  Copyright © 2019 Manas Johri. All rights reserved.
//

import XCTest

/*
 
 Given an integer array nums, find the sum of the elements between indices i and j (i ≤ j), inclusive.
 
 The update(i, val) function modifies nums by updating the element at index i to val.
 
 Example:
 
 Given nums = [1, 3, 5]
 
 sumRange(0, 2) -> 9
 update(1, 2)
 sumRange(0, 2) -> 8
 Note:
 
 The array is only modifiable by the update function.
 You may assume the number of calls to update and sumRange function is distributed evenly.
 
 */

class _07: XCTestCase {

    override func tearDown() {}
    
    override func setUp() {}
    
    func testSolution() {
        
        class NumArray {
            
            var ds: [Int]
            
            init(_ nums: [Int]) {
                self.ds = nums
            }
            
            func update(_ i: Int, _ val: Int) {
                if i>=0 && i<ds.count {
                    ds[i] = val
                }
            }
            
            //..
            //try logn sol
            
            func sumRange(_ i: Int, _ j: Int) -> Int {
                
                //alter way but consumes time/space for slicing, inefx w.r.t regular loop-range sum
                //let res = ds[i...j].reduce(0,+)
                
                var res = 0
                for sdx in i...j {
                    res += ds[sdx]
                }
                return res
            }
        }
        
        let nums = [1,2,3,4,5]
        let obj = NumArray(nums)
        obj.update(3, 6)
        print(obj.ds)
        print(obj.sumRange(0, 4))
    }
}

