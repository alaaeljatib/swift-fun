import UIKit

class Solution {
    func coinChange(_ coins: [Int], _ amount: Int) -> Int {
        if (amount <= 0 || coins.count == 0) {
            return 0
        }
        
        let max = amount + 1;
        var dp : [Int: Int] = [:]
        
        for num in 0...amount {
            dp[num] = max
        }
        
        dp[0] = 0;
        for i in 1...amount {
            for j in 0..<coins.count {
                if (coins[j] <= i) {
                    dp[i] = min(dp[i]!, dp[i - coins[j]]! + 1)
                }
            }
        }
        return dp[amount]! > amount ? -1 : dp[amount]!
    }
}

let x = Solution()

print(x.coinChange([1,2,5], 11))
