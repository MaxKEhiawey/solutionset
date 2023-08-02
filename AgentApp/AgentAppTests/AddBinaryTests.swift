//
//  AddBinaryTests.swift
//  AgentAppTests
//
//  Created by AMALITECH MACBOOK on 02/08/2023.
//

import XCTest
@testable import AgentApp

final class AddBinaryTests: XCTestCase {

    func testAddBinary() {
        let addBinary = AddBinary()

            // Test cases with different binary numbers

            // Test case 1
        XCTAssertEqual(addBinary.addBinary("11", "1"), "100", "Failed for '11' + '1'")

            // Test case 2
        XCTAssertEqual(addBinary.addBinary("1010", "1011"), "10101", "Failed for '1010' + '1011'")

            // Test case 3
        XCTAssertEqual(addBinary.addBinary("0", "0"), "0", "Failed for '0' + '0'")

            // Test case 4
        XCTAssertEqual(addBinary.addBinary("111", "111"), "1110", "Failed for '111' + '111'")
    }
}
