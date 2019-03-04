import UIKit

class Solution {
    func rotateString(_ A: String, _ B: String) -> Bool {
        if A.count != B.count { return false}
        if A.count == 0 {return true}
        
        var i = 0
        while i < A.count && A[0] != B[i]  {
            print(A[0] != B[i], A[0], B[i])
            i = i + 1
        }
        
        if i == A.count {return false }

        print(i)
        for j in 0..<A.count {
            if A[j] != B[((i + j) % A.count)] {
                return false
            }
        }
        return true
        
    }
}
extension String {
    subscript (i: Int) -> Character {
        return self[index(startIndex, offsetBy: i)]
    }
}

let x = Solution()

print(x.rotateString("abcdefg", "defgabc"))

class Solution2 {
    func rotateString(_ A: String, _ B: String) -> Bool {
        return A.count == B.count && ((A+A).contains(B) || A.count == 0);
        
    }
}
