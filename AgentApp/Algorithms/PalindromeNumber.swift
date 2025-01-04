//
//  PalindromeNumber.swift
//  AgentApp
//
//  Created by AMALITECH MACBOOK on 19/07/2023.
//

import Foundation

class  PalindromeNumber {

    func isPalindrome(_ x: Int) -> Bool {
        if x < 0 {
            return false
        }
        var number = x
        var reverse = 0
        while number != 0 {
            let remainder = number % 10
            reverse = reverse * 10 + remainder
            number /= 10
        }
        return x == reverse
    }
}

class  PalindromeNumber2 {
    
func isPalindrome(_ x: Int) -> Bool {
    // Negative numbers and numbers ending with 0 (except 0 itself) are not palindromes
    if x < 0 || (x % 10 == 0 && x != 0) {
        return false
    }
    
    var original = x
    var reversed = 0
    
    // Reverse half of the number
    while original > reversed {
        let digit = original % 10
        reversed = reversed * 10 + digit
        original /= 10
    }
    
    // Check if the original is equal to the reversed part
    // For odd-length numbers, ignore the middle digit
    return original == reversed || original == reversed / 10
}
}
