

class Solution {
    
    enum OperatorsType: String {
        typealias RawValue = String
        
        case Plus = "+",
        Minus = "-",
        Times = "*",
        Devide = "/",
        None = ""
    }
    
     func calculate(_ s: String) -> Int {
        var result = 0;
        let operators  = ["+", "-", "*", "/"]
        var prefNumber = 0;
        var postNumber = 0
        var currentOperator : OperatorsType = .None
        var prevTerm = 0
        
        for char in s {
            
            if "0"..."9" ~= char && currentOperator == .None {
                print("prefix", char)
                prefNumber =  prefNumber * 10 + Int(String(char))!
                continue
            }
            
            if "0"..."9" ~= char && currentOperator != .None {
                print("PostFix", char)
                postNumber = postNumber * 10 + Int(String(char))!
                if prevTerm != 0 {
                    prefNumber = prevTerm
                    prevTerm = 0
                }
                continue
            }
            
            if  operators.contains(String(char))  {
                print("currentOperator", currentOperator, char)
                if (currentOperator == .None) {
                    currentOperator = self.setCurrentOperatorValue(char)
                    continue
                    
                } else {
                    switch currentOperator {
                    case .Plus:
                        prevTerm = prefNumber + postNumber
                        break
                    case .Minus:
                        prevTerm = prefNumber - postNumber
                        break
                    case .Times:
                        prevTerm = prefNumber * postNumber
                        break
                    case .Devide:
                        prevTerm = prefNumber / postNumber
                        break
                    default:
                        break
                    }
                    
                    
                    currentOperator = self.setCurrentOperatorValue(char)
                    prefNumber = 0
                    postNumber = 0
                    continue
                }
            }
            
        }
        
        switch currentOperator {
        case .Plus:
            result += prefNumber + postNumber
            break
        case .Minus:
            result += prefNumber - postNumber
            break
        case .Times:
            result += prefNumber * postNumber
            break
        case .Devide:
            result += prefNumber / postNumber
            break
        default:
            break
        }
        
        return result
    }
    
    private func setCurrentOperatorValue(_ char: Character) -> OperatorsType {
        switch char {
        case "+":
            return .Plus
        case "-":
            return .Minus
        case "/":
            return .Devide
        case "*":
            return .Times
        default:
            return .None
        }
    }
}

let x = Solution()
x.calculate("3+2*4+14-4")


