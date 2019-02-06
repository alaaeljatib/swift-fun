// Playground - noun: a place where people can play

import UIKit

var numList = [2,44,5,3,1,66,7,22,3,4,5,8,9,99,0]
func binarySearch(array: [Int], target: Int) -> Bool {
    
    var left = 0
    var right = array.count - 1
    
    while (left <= right) {
        let mid = (left + right) / 2
        let value = array[mid]
        
        if (value == target) {
            return true
        }
        
        if (value < target) {
            left = mid + 1
        }
        
        if (value > target) {
            right = mid - 1
        }
    }
    
    return false
}

binarySearch(numList,3)
binarySearch(numList,88)