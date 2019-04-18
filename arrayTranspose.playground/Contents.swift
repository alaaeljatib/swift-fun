import UIKit

class Solution {
    func transpose(_ a: [[Int]]) -> [[Int]] {
        guard a.count > 0, a[0].count > 0 else {return []}
        
        var trArr : [[Int]] = []
        for i in 0..<a[0].count {
            
            var trRow :[Int] = []
            
            for j in 0..<a.count {
                trRow.append(a[j][i])
            }
            
            trArr.append(trRow)
        }
        return trArr
    }
}

let x = Solution()

x.transpose([[1,2,3], [4,5,6], [7,8,9],[10,11,12], [13,14,15]])
