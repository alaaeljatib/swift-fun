import UIKit
class Solution {
    func isMonotonic(_ a: [Int]) -> Bool {
        guard a.count > 1 else { return true}
        
        var isDirectionSet = false
        var isAsc = false
        
        for i in 0..<a.count - 1 {
            if a[i] == a[i+1] {
                continue
            }
            
            if !isDirectionSet {
                isAsc = a[i] < a[i+1]
                isDirectionSet = true
            }
            
            if isAsc {
                if a[i] > a[i + 1] {
                    return false
                }
            } else {
                if a[i] < a[i + 1] {
                    return false
                }
            }
        }
        
        return true
    }
}
let x = Solution()

x.isMonotonic([1,2,2,3])
