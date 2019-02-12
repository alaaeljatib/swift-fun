class Solution {
    func longestPalindrome(_ s: String) -> Int {

        var countDict: [Character: Int] = [:]
        
        for c in s {
            if let _ = countDict[c] {
                countDict[c]! += 1
            } else {
                countDict[c] = 1
            }
            
        }
        var ans = 0;
        for num in countDict.values {
            ans +=  num / 2 * 2;
            if (ans % 2 == 0 && num % 2 == 1) {
                ans += 1;
            }
        }
        return ans;
    }
}

let x = Solution()
debugPrint(x.longestPalindrome("testaabbccddeddccbbaatest"))

