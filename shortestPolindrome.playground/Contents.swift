class Solution {
    func shortestPalindrome(_ s: String) -> String {
        guard s.count > 1 else {return s}
        let revStr = String(s.reversed())
        let n = s.count
        for i in 0..<n {
            if (s[..<s.index(s.startIndex, offsetBy: n - i)] == revStr[revStr.index(revStr.startIndex, offsetBy: i)...]) {
                let subStringToAdd = i > 0 ? revStr[..<revStr.index(revStr.startIndex, offsetBy:i)] : ""
                return subStringToAdd + s
            }
        }
        return ""
    }
}
