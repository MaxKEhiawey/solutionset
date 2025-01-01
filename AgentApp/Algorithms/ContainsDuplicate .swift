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
