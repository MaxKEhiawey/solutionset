//
//  ContainsDuplicate .swift
//  AgentApp
//
//  Created by AMALITECH MACBOOK on 20/07/2023.
//

import Foundation

class ContainsDuplicate {

    func containsDuplicate(_ nums: [Int]) -> Bool {
        let arr = nums
        var numSet = Set<Int>()
        for number in arr {
            if numSet.contains(number) {
                return true
            }
            numSet.insert(number)
        }
        return false
    }
}


class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var numAndIndex: [Int: Int] = [:]
    for (index, number) in nums.enumerated() {
        let compNum = target - number
        if let compNumIndex = numAndIndex[compNum] {
            return [index, compNumIndex]
        }
        numAndIndex[number] = index
    }
    return []
    }
}


class Solution {
    func missingNumber(_ nums: [Int]) -> Int {
        let n = nums.count
        let totalSum = n * (n + 1) / 2
        let arraySum = nums.reduce(0, +)
     return totalSum - arraySum
    }
}


class Solution {
    func climbStairs(_ n: Int) -> Int {
        if n <= 2 { return n }
    
    var prev1 = 2 // f(2)
    var prev2 = 1 // f(1)
    
    for _ in 3...n {
        let current = prev1 + prev2
        prev2 = prev1
        prev1 = current
    }
    return prev1
    }

class Solution {
    func singleNumber(_ nums: [Int]) -> Int {
        var value = 0
        for num in nums {
        value ^= num
        }
        return value
    }
}

func singleNumberWithTriplicates(_ nums: [Int]) -> Int {
    var ones = 0
    var twos = 0
    
    for num in nums {
        // Update 'ones' to track bits appearing once
        ones = (ones ^ num) & ~twos
        // Update 'twos' to track bits appearing twice
        twos = (twos ^ num) & ~ones
    }
    
    return ones
}
