import UIKit

var str = "Hello, playground"

func isPrime(_ x : Int) -> Bool {
    
    let sqrtX = Int(sqrt(Double(x)))
    for i in 2..<sqrtX {
        if x % i == 0 {
            return false
            
        }
    }
    return true
}

let x = 8
print(isPrime(x))
