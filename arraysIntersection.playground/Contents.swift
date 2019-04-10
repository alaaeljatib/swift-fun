import UIKit

class Solution {
    func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        guard nums1.count > 0 && nums2.count > 0 else {
            return []
        }
        
        var counterDict :[Int:Int] = [:]
        
        
        for k in 0..<nums1.count {
            let i = nums1[k]
            if let _ = counterDict[i] {
                counterDict[i] = counterDict[i]! + 1
            } else {
                counterDict[i] = 1
            }
        }
        
        return nums2.filter {
            if let _ = counterDict[$0] {
                if counterDict[$0]! > 0 {
                    counterDict[$0] = counterDict[$0]! - 1
                    return true
                }
            }
            return false
        }
    }
}

let x = Solution()
x.intersect([1,2,3,4,5], [2,3,4,4])
