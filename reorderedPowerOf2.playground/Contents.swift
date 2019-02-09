class Solution {
    func reorderedPowerOf2(_ N: Int) -> Bool {
        let a = count(N);
        for i in 0...31 {
            if a.elementsEqual(count(1 << i)) {
                return true;
            }
        }
        return false;
    }
    
    func count(_ N: Int) -> [Int] {
        var n = N
        var ans =  [Int](repeating: 0, count: 31)
        while (n > 0) {
            let indx = n % 10;
            ans[indx] = ans[indx] + 1;
            n /= 10;
        }
        return ans
    }
}
