
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
                count = count*10 + Int("\(Array(temp)[i])")!
            }
            
            temp = ""
            
        }
        return result
    }
    
    static func decodeStringWithRecursiveLogic(_ s: String) -> String {
        var indx = 0
        return decodeStringRec(s, &indx)
    }
    
    static private func decodeStringRec(_ s: String, _ indx : inout Int) -> String {
        if (s.count == 0 ) {
            return ""
        }
        
         var result = ""
         var number = 0
        
        while (indx < s.count && Array(s)[indx] != "]") {
           
            let currentChar = Array(s)[indx]
            
    
            
            if "0"..."9" ~= currentChar { // is number
                number = number * 10 + Int(String(currentChar))!
                indx += 1
        
            }
            
            if "a"..."z" ~= currentChar || "A"..."Z" ~= currentChar { // is letter
                result += String(currentChar)
                indx += 1
            }
            
            if currentChar == "[" {
                indx += 1
                let innerString = decodeStringRec(s, &indx)
                
                while (number > 0) {
                    result += innerString
                    number -= 1
                }
            }
        }
 
        indx += 1;
        return result
    }
}

 Solution.decodeStringWithRecursiveLogic("3[a]2[bc]")
