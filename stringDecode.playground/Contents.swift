import UIKit

class Solution {
    func decodeString(_ s: String) -> String {
        if (s.count == 0 ) {return ""
        };
        var result = ""
        var count = 0
        var temp = ""
        
        for chr in s {
            
            if chr == "]" {
                result += String(repeating: temp, count: count)
                temp = ""
                count = 0
                continue
            }
            
            if chr != "[" {
                temp += String(chr)
                continue
            }
            
            let numOfDigits = Array(temp).count
            
            for  i in 0..<numOfDigits {
                count += Int("\(Array(temp)[i])") ?? 0 * Int(truncating:NSDecimalNumber(decimal:pow(10,numOfDigits - 1 - i)))
            }
            
            temp = ""
            
        }
        return result
    }
}
