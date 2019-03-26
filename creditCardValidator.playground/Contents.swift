import Foundation

func isValidCardNumber(_ card: String) -> String {
    // make sure card length is 16 and it contains number only
    guard String(card.unicodeScalars.filter{ CharacterSet.decimalDigits.contains($0)}).count == 16 else {return "No"}
    
    // Reveree Card
    let revCard = String(card.reversed())
    var A = 0
    var BArray : [Int] = []
    // sum Odds to A and append evens to BArray
    for i in 1...revCard.count {
        if i % 2 != 0 {
            // swift 4.2 syntax for String subscrpiting
            A = A + Int(String(revCard[revCard.index(revCard.startIndex, offsetBy: i - 1)]))!
        } else {
            BArray.append(Int(String(revCard[revCard.index(revCard.startIndex, offsetBy: i - 1)])) ?? 0)
        }
    }
    
    //Dublicate BArray Items
    BArray = BArray.map{$0 * 2}
    // sum the two digits at BArray
    BArray = BArray.map{if $0 > 9 {
         return Int($0/10 + $0 % 10)}
        return $0
    }
    // Sum BArray to B
    let B = BArray.reduce(0, +)
    
    // Sum A and B
    if (A + B) % 10 == 0 {
        return "Yes"
    }
    
    return "No"
}
isValidCardNumber("4520020026408328")
