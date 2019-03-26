import Foundation

// Complete the countingValleys function below.
func countingValleys(n: Int, s: String) -> Int {
    guard s.count > 0 else {return 0}
    
    var stepCounter = 0
    var
    numOfValleys = 0
    
    for step in s {
        switch step {
        case "U":
            stepCounter = stepCounter + 1
            if stepCounter == 0 {
                numOfValleys = numOfValleys + 1
            }
            break
        case "D":
            stepCounter = stepCounter - 1
        default:
            break
        }
        
    }
    
    return numOfValleys
}
