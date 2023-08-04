//
//  JumpGameTests.swift
//  AgentAppTests
//
//  Created by AMALITECH MACBOOK on 04/08/2023.
//

import XCTest
@testable import AgentApp

final class JumpGameTests: XCTestCase {
    
    func testJump() {
        let jumpGame = JumpGame()

            // Test cases with different input arrays

            // Test case 1: Shortest input, should return 0 as no jump is needed
        XCTAssertEqual(jumpGame.jump([0]), 0, "Failed for [0]")

            // Test case 2: Simple input, single jump needed to reach the end
        XCTAssertEqual(jumpGame.jump([2, 3, 1, 1, 4]), 2, "Failed for [2, 3, 1, 1, 4]")

            // Test case 3: Complex input, multiple jumps needed to reach the end
        XCTAssertEqual(jumpGame.jump([3, 2, 1, 0, 4]), 2, "Failed for [3, 2, 1, 0, 4]")

            // Test case 4: Input with no jumps possible, should return 0 as it's impossible to reach the end
        XCTAssertEqual(jumpGame.jump([0, 0, 0, 0, 0]), 0, "Failed for [0, 0, 0, 0, 0]")
    }
}

