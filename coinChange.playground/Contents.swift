import UIKit

class Solution {
    func coinChange(_ coins: [Int], _ amount: Int) -> Int {
        if (amount <= 0 || coins.count == 0) {
            return 0
        }
        
        
        var numberOfCoins = 0
        var leftToDevide = amount
        let sortedCoins = coins.sorted(){$0 > $1}
        
        for coin in sortedCoins {
            
            numberOfCoins += leftToDevide / coin
            leftToDevide = amount % coin
            
            if (leftToDevide == 0) {
                return numberOfCoins
            }
        }
        
        return -1
    }
}

let x = Solution()

print(x.coinChange([1,3,5], 6))
