//
//  Fibonacci_SequenceTests.swift
//  Fibonacci SequenceTests
//
//  Created by 262Hz on 9/18/14.
//  Copyright (c) 2014 Thinkful. All rights reserved.
//

import UIKit
import XCTest

class Fibonacci_SequenceTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        XCTAssert(true, "Pass")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock() {
            // Put the code you want to measure the time of here.
        }
    }
    
    // On your computer, press command+U to run the tests. We're calculating the first 90 numbers in the FibonacciSequence 100 times to see how long it takes.

    // Plenty fast enough.
    func testFibonacciSequence() {
        measureBlock() {
            for _ in 1...100 {
                let fibonacciSequence = FibonacciSequence(numberOfItemsInSequence: 90, includesZero: true)
            }
        }
    }
    
    // Faster.
    func testFibonacciCheater() {
        measureBlock() {
            for _ in 1...100 {
                let fibonacciSequence = FibonacciCheater(numberOfItemsInSequence: 90, includesZero: true)
            }
        }
    }
    
    // Fastest, but it also does not check for "includesZero" or overflows.
    func testFibonacciAdvanced () {
        self.measureBlock() {
            for _ in 1...100 {
                let fibonacciSequence = FibonacciAdvanced(numberOfItemsInSequence: 90, includesZero: true)
            }
        }
    }
}
