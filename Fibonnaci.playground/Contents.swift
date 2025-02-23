import UIKit

// 0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89


func fibonaci(n: Int) -> [Int] {
    if n == 0 {
        return []
    }
    if n == 1 {
        return [0]
    }
    
    var fibonacciSequence: [Int] = [0,1]
    
    for i in 2..<n {
        let result = fibonacciSequence[i-1] + fibonacciSequence[i-2]
        fibonacciSequence.append(result)
    }
    
    return fibonacciSequence
}

print(fibonaci(n: 0))
print(fibonaci(n: 1))
print(fibonaci(n: 2))
print(fibonaci(n: 5))
