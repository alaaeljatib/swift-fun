import Foundation

// Complete the repeatedString function below.
func repeatedString(s: String, n: Int) -> Int {
    guard s.count > 0 else { return 0}
    
    //    if s.count == 1 {
    //        if s == "a" {
    //            return n
    //        }
    //        return 0
    //    }
    
    let numOfRepeatedFirstChars = s.filter{$0 == "a"}.count
    
    let modValue = n % s.count
    let indexValue = modValue > 0 ? modValue - 1 : 0
    let extraRepeated = s[...s.index(s.startIndex, offsetBy: indexValue)].filter{$0 == "a"}.count
    
    return (numOfRepeatedFirstChars * (n / s.count)) + extraRepeated
}


repeatedString(s: "kmretasscityylpdhuwjirnqimlkcgxubxmsxpypgzxtenweirknjtasxtvxemtwxuarabssvqdnktqadhyktagjxoanknhgilnm", n: 736778906400)

