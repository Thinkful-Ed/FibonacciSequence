//
//  FibonacciSequence.swift
//  Fibonacci Sequence
//
//  Created by 262Hz on 9/18/14.
//  Copyright (c) 2014 Thinkful. All rights reserved.
//

class FibonacciSequence {
    
    let includesZero: Bool
    let values: [UInt64] // If you're wondering why we used UInt64 instead of UInt, try doing a find-and-replace in this file to use UInt instead of UInt64. You'll also have to change the "type cast" in the ViewController.swift file. Then if you run the app on the iPhone 5S simulator it will work just fine becuase iPhone 5S is a 64-bit platform. However if you run the app on the iPhone 5 simulator, you won't be able to see as many numbers. That's because the iPhone 5 is a 32-bit bit platform, so UInt is the same as UInt32 on the iPhone 5, but we really want it to be UInt64 regardless of the platform.
    
    init(maxNumber: UInt64, includesZero: Bool) {
        self.includesZero = includesZero
        if maxNumber == 0 && includesZero == false {
            values = []
        } else if maxNumber == 0 {
            values = [0]
        } else {
            var sequence: [UInt64] = [0,1,1]
            var nextNumber: UInt64 = 2
            while nextNumber <= maxNumber {
                sequence.append(nextNumber)
                let lastNumber = sequence.last!
                let secondToLastNumber = sequence[sequence.count-2]
                let (sum, didOverflow) = UInt64.addWithOverflow(lastNumber, secondToLastNumber)
                if didOverflow == true {
                    println("Overflow! The next number is too big to store in a UInt64!")
                    break
                }
                nextNumber = sum
            }
            if includesZero == false {
                sequence.removeAtIndex(0)
            }
            values = sequence
        }
    }
    
    init(numberOfItemsInSequence: UInt64, includesZero: Bool) {
        self.includesZero = includesZero
        if numberOfItemsInSequence == 0 {
            values = []
        } else if numberOfItemsInSequence == 1 {
            if includesZero == true {
                values = [0]
            } else {
                values = [1]
            }
        } else {
            var sequence: [UInt64]
            if includesZero == true {
                sequence = [0,1]
            } else {
                sequence = [1,1]
            }
            for var i = 2; i < Int(numberOfItemsInSequence); i++ {
                let lastNumber = sequence.last!
                let secondToLastNumber = sequence[sequence.count-2]
                let (nextNumber, didOverflow) = UInt64.addWithOverflow(lastNumber, secondToLastNumber)
                if didOverflow == true {
                    println("Overflow! The next number is too big to store in a UInt64!")
                    break
                }
                sequence.append(nextNumber)
            }
            values = sequence
        }
    }
}
