//
//  AddBinary.swift
//  AgentApp
//
//  Created by AMALITECH MACBOOK on 02/08/2023.
//

import Foundation

class AddBinary {
    
    func addBinary(_ a: String, _ b: String) -> String {
        var result = ""
        let a = Array(a)
        let b = Array(b)

        var indexA = a.count - 1
        var indexB = b.count - 1
        var carry = 0
        while indexA >= 0 || indexB >= 0 {
                //a and b may have different length
            let bitA = indexA >= 0 ? Int(String(a[indexA]), radix: 2) : 0
            let bitB = indexB >= 0 ? Int(String(b[indexB]), radix: 2) : 0
            var sum = bitA! + bitB! + carry
            carry = sum / 2
            sum %= 2
            result.insert("\(sum)".first!, at: result.startIndex)
            indexA -= 1
            indexB -= 1
        }
        if carry != 0 {
            result.insert("\(carry)".first!, at: result.startIndex)
        }
        return result
    }
}
