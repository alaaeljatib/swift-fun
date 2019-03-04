import Foundation


// https://gist.github.com/jebora/d62f8ae7843a0372d062fae9820aab97

struct Activity {
    let date: String
    let type: String
    let symbol: String?
    let country: String?
    let quantity: Int
    let netAmount: Double
}

struct Stock : Equatable {
    public private(set) var symbol: String?
    public private(set) var country: String?
    public  var quantity: Int
    public var  netAmount: Double
    
    static func ==(lhs: Stock, rhs: Stock) -> Bool {
        return lhs.symbol == lhs.symbol && lhs.country == lhs.country
    }
}

let activities = [
    Activity(date: "2015-02-25", type: "DEP", symbol: nil, country: nil, quantity: 0, netAmount: 200),
    Activity(date: "2015-03-01", type: "WDL", symbol: nil, country: nil, quantity: 0, netAmount: -50),
    Activity(date: "2015-02-26", type: "BUY", symbol: "ACB", country: "CA", quantity: 3, netAmount: -70),
    Activity(date: "2015-02-26", type: "BUY", symbol: "ACB", country: "US", quantity: 5, netAmount: -40),
    Activity(date: "2015-02-27", type: "SELL", symbol: "ACB", country: "CA", quantity: -1, netAmount: 60)
]

class User {
    var currentCashBalance : Double = 0
    
    var protfolio : [Stock] = []
}

class StockServic {
    static let instance = StockServic()
    
    var updatedBalance : Double = 0
    var portfolio : [Stock] = []
    
    func getUpdatedPortfolioFromActivities(_ user: User, activities: [Activity]) {
        
        self.updatedBalance = user.currentCashBalance
        self.portfolio = user.protfolio
        
        for item in activities {
            switch item.type {
            case "DEP"
            case "WDL":
                self.updatedBalance += item.netAmount
                return
                
            case "BUY":
                
                if (self.updatedBalance > item.netAmount) {
                    if (self.portfolio.contains(item)) {
                        for stock in self.portfolio {
                            if (stock == item) {
                                stock.quantity += item.quantity
                                stock.net_amount += item.net_amount
                                self.updatedBalance -= item.net_amount
                                break
                            }
                        }
                        
                    } else {
                        let newStock =  Stock(symbol:item.symbol, country: item.country, quantity: item.quantity, netAmount: item.net_amount)
                        
                        self.portfolio.append(newStock)
                    }
                } else {
                    print("Balance not sufficient")
                    
                }
                return
                
            case "SELL":
                
                if (self.portfolio.contains(item)) {
                    for stock in self.portfolio {
                        if (stock == item ) {
                            if (stock.quantity - item.quantity > 0) {
                                stock.quantity += item.quantity
                                stock.net_amount += item.net_amount
                                self.updatedBalance += item.net_amount
                                break
                            } else if (stock.quantity - item.quantity == 0) {
                                self.portfolio.remove(item)
                            }
                        } else {
                            "Error, there is no Stock with such symbol"
                        }
                        
                    } else {
                        "Error, there is no Stock with such symbol"
                    }
                }
                return
                
            default:
                return
            }
        }
    }
    
    
    func getCurrentCashBalance() -> Double {
        return self.updatedBalance
    }
}

let user = User()

user.currentCashBalance += StockServic.instance.getCurrentCashBalance()
StockServic.instance.getUpdatedPortfolioFromActivities(user, activities: activities)

user.protfolio = StockServic.instance.portfolio

