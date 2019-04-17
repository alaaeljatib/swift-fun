import UIKit

class Solution {
    func isMonotonic(_ a: [Int]) -> Bool {
        guard a.count > 1 else { return true}
        
        print(a.last ?? 0)
        print(a.count)
        print(a.reduce(0,+))

        
        return (a.last ?? 0 ) * a.count >= a.reduce(0,+)
    }
}
let x = Solution()

x.isMonotonic([1,2,2,3])
