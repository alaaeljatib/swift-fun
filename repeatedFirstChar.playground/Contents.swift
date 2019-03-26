import Foundation

// Complete the repeatedString function below.
func repeatedString(s: String, n: Int) -> Int {
    guard s.count > 0, n >= s.count else { return 0}
    
    if s.count == 1 {
        return n
    }
    
    
    var numOfRepeatedFirstChars = 0
    
    for c in s {
        if c == s[s.startIndex] {
            numOfRepeatedFirstChars = numOfRepeatedFirstChars + 1
        }
    }
    
    if numOfRepeatedFirstChars == 1 {
        return n
    } else {
        let modValue = n % s.count
        
        var extraRepeated = 0
        for i in 1...modValue {
            if s[s.startIndex] == s[s.index(s.startIndex, offsetBy: i)] {
                extraRepeated  = extraRepeated + 1
            }
        }
        
        return (numOfRepeatedFirstChars * (n / s.count)) + extraRepeated
    }
}

repeatedString(s: "gfcaaaecbg", n: 547602)

