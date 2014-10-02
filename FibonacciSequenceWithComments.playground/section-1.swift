// Thinkful Playground
// Thinkful.com

// Fibonacci Sequence

// By definition, the first two numbers in the Fibonacci sequence are 1 and 1, or 0 and 1, depending on the chosen starting point of the sequence, and each subsequent number is the sum of the previous two.

class FibonacciSequence {
    
    let includesZero: Bool
    let values: [UInt]
    
    init(maxNumber: UInt, includesZero: Bool) {
        self.includesZero = includesZero
        if maxNumber == 0 && includesZero == false {
            values = [] // Apparently the caller wants an empty array, so that's what we'll give them :)
        } else if maxNumber == 0 {
            values = [0] // Modern usage often includes zero as the first number.
        } else {
            var sequence: [UInt] = [0,1,1] // If maxNumber is not zero, then it must be 1 or higher. Remember that this is a UInt so we don't have to worry about negative numbers :)
            var nextNumber: UInt = 2 // The next number would be 2 and the "while loop" will only run if our max number is actually 2 or higher.
            while nextNumber <= maxNumber {
                sequence.append(nextNumber) // Add the next number
                let lastNumber = sequence.last!
                let secondToLastNumber = sequence[sequence.count-2]
                let (sum, didOverflow) = UInt.addWithOverflow(lastNumber, secondToLastNumber) // Add the last two numbers together to get the next number. If it overflows, we've exceeded the limits of UInt.
                if didOverflow == true {
                    println("Overflow! The next number is too big to store in a UInt!")
                    break
                }
                nextNumber = sum // In a case of overflow, this line never gets excecuted.
            }
            if includesZero == false {
                sequence.removeAtIndex(0) // Remove the first item which was zero by definition. Whoever created this instance wishes to believe that the Fibonacci sequence actually begins with 1 :)
            }
            values = sequence
        }
    }
    
    init(numberOfItemsInSequence: UInt, includesZero: Bool) {
        self.includesZero = includesZero
        if numberOfItemsInSequence == 0 {
            values = [] // The caller wants an empty array, no numbers!
        } else if numberOfItemsInSequence == 1 {
            if includesZero == true {
                values = [0]
            } else {
                values = [1]
            }
        } else { // numberOfItemsInSequence must be greater than 1 since we are using UInt.
            var sequence: [UInt]
            if includesZero == true {
                sequence = [0,1]
            } else {
                sequence = [1,1]
            }
            for var i = 2; i < Int(numberOfItemsInSequence); i++ {
                let lastNumber = sequence.last!
                let secondToLastNumber = sequence[sequence.count-2]
                let (nextNumber, didOverflow) = UInt.addWithOverflow(lastNumber, secondToLastNumber) // Add the last two numbers together to get the next number. If it overflows, we've exceed the limits of UInt
                if didOverflow == true {
                    println("Overflow! The next number is too big to store in a UInt!")
                    break
                }
                sequence.append(nextNumber) // Add the next number. In a case of overflow, this line never gets excecuted.
            }
            values = sequence
        }
    }
}

let fibanocciSequence = FibonacciSequence(maxNumber:12345, includesZero: true) // Try using different max numbers like 0, 1, 2, and see what happens if you try to enter a negative number or a floating point value. The FibonacciSequence class has been built to be pretty fool proof.

println(fibanocciSequence.values) // Make sure (on your computer) to go to View -> Assistant Editor -> Show Assistant Editor so that you can see the console output.

let anotherSequence = FibonacciSequence(numberOfItemsInSequence: 13, includesZero: true)

println(anotherSequence.values)

UInt.max // This is the maximum number which can be stored in a UInt.
