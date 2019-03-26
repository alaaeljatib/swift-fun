import Foundation

// Complete the jumpingOnClouds function below.
func jumpingOnClouds(c: [Int]) -> Int {
    guard c.count > 0 && c[0] == 0  else {return 0}
    
    var numOfSteps = 0
    
    var currentPosition = 0
    
    while currentPosition < c.count {
        if currentPosition + 2 < c.count && c[currentPosition + 2] == 0 {
            currentPosition = currentPosition + 2
            numOfSteps = numOfSteps + 1
        } else if currentPosition + 1 < c.count && c[currentPosition + 1] == 0 {
            currentPosition = currentPosition + 1
            numOfSteps = numOfSteps + 1
        } else if currentPosition == c.count - 1 {
            return numOfSteps
        } else {
            return -1
        }
    }
    return numOfSteps
    
}
