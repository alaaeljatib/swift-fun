class Solution {
    func minSwapsCouples(_ row: [Int]) -> Int {
        var mutRow = row
        var counter = 0
        for i in 0..<row.count - 1 {
            if row[i] - 1...row[i]+1 ~= row[i+1] {
                continue
            } else {
                
                for j in i+1..<row.count {
                    if row[i] - 1...row[i]+1 ~= row[j] {
                        counter += 1
                        swap(&mutRow,first: i,second: j)
                        break
                    }
                }
            }
        }
        return counter
    }
    
    private func swap(_ row : inout [Int], first a: Int,  second b: Int) {
        let temp = row[a]
        row[a] = row[b]
        row[b] = temp
    }
}

let x = Solution()
print(x.minSwapsCouples([4,2,1,3]))
