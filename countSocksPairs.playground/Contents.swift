import UIKit

func sockMerchant(n: Int, ar: [Int]) -> Int {
    var dictCount : [Int: Int] = [:]
    
    for i in ar {
        if let _ = dictCount[i] {
            dictCount[i] = dictCount[i]! + 1
        } else {
            dictCount[i] = 1
        }
    }
    
    print(dictCount)
    var numOfPairs = 0
    
    for (_ , value) in dictCount {
        numOfPairs = numOfPairs + value/2
    }
    
    return numOfPairs
}

sockMerchant(n: 9, ar: [10 , 20, 20, 10, 10, 30, 50, 10, 20])
