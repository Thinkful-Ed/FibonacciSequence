//
//  FibonacciModel.swift
//  Fibonacci Sequence
//
//  Created by 262Hz on 9/18/14.
//  Copyright (c) 2014 Thinkful. All rights reserved.
//

// This "advanced" version of the FibonacciSequence uses a GeneratorType.

class FibonacciAdvanced {
    
    let includesZero: Bool
    let values: [UInt64]
    
    private struct FibGenerator : GeneratorType {
        
        typealias Element = UInt64
        
        var a: UInt64 = 0
        var b: UInt64 = 0
        
        mutating func next() -> UInt64? {
            if (a == 0) {
                a = 1
                return 1
            }
            if (b == 0) {
                b = 1
                return 1
            }
            let sum = a + b
            a = b
            b = sum
            return sum
        }
    }
    
    init(numberOfItemsInSequence: UInt64, includesZero: Bool) {
        self.includesZero = false //TODO: Complete the implementation by properly considering the includesZero paramater. Right now the generator always starts with 1.
        var fib = FibGenerator()
        // TODO: Gracefully handle error caused by overflow.
        values = map(0..<numberOfItemsInSequence, {
            (value:UInt64) -> UInt64 in
            return fib.next()!
        })
    }
}