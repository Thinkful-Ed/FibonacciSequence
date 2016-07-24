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
            values = []
        } else if maxNumber == 0 {
            values = [0]
        } else {
            var sequence: [UInt] = [0,1,1]
            var nextNumber: UInt = 2
            while nextNumber <= maxNumber {
                sequence.append(nextNumber)
                let lastNumber = sequence.last!
                let secondToLastNumber = sequence[sequence.count-2]
                let (sum, didOverflow) = UInt.addWithOverflow(lastNumber, secondToLastNumber)
                if didOverflow == true {
                    print("Overflow! The next number is too big to store in a UInt!")
                    break
                }
                nextNumber = sum
            }
            if includesZero == false {
                sequence.remove(at: 0)
            }
            values = sequence
        }
    }
    
    init(numberOfItemsInSequence: UInt, includesZero: Bool) {
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
            var sequence: [UInt]
            if includesZero == true {
                sequence = [0,1]
            } else {
                sequence = [1,1]
            }
            for _ in 2 ..< Int(numberOfItemsInSequence) {
                let lastNumber = sequence.last!
                let secondToLastNumber = sequence[sequence.count-2]
                let (nextNumber, didOverflow) = UInt.addWithOverflow(lastNumber, secondToLastNumber)
                if didOverflow == true {
                    print("Overflow! The next number is too big to store in a UInt!")
                    break
                }
                sequence.append(nextNumber)
            }
            values = sequence
        }
    }
}

let fibonacciSequence = FibonacciSequence(maxNumber:12345, includesZero: true)

print(fibonacciSequence.values)

let anotherSequence = FibonacciSequence(numberOfItemsInSequence: 113, includesZero: true)

print(anotherSequence.values)

UInt.max
