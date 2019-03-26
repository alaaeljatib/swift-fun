import Foundation

func countDuplicates(_ arr: [Int]) -> Int {
    guard arr.count > 0 else {return 0}
    
    var dictCounter :[ Int: Int] = [:]
    
    var numberOfDuplicates = 0
    // Count the occurrencies for each item in arr and save it in Dict
    for i in arr {
        if let _ = dictCounter[i] {
            if (dictCounter[i] == 1) {
                numberOfDuplicates = numberOfDuplicates + 1
            }
            dictCounter[i] = dictCounter[i]! + 1
        } else {
            dictCounter[i] = 1
        }
    }
    return numberOfDuplicates
}

countDuplicates([1, 2, 3,4,5, 1, 2])
