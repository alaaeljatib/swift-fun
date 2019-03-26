import UIKit

func pivotIndex(_ nums: [Int]) -> Int {
    let sumNums = nums.reduce(0, +)
    var leftSum = 0
    for i in 0..<nums.count {
        if leftSum == sumNums - leftSum - nums[i] {
            return i
        }
        leftSum = leftSum + nums[i]
    }
    
    return -1
}
