import Foundation

struct Item : Codable {
    public private(set) var id : String
    public private(set) var name : String
    public private(set) var description : String
}
extension Item: Comparable {
    static func == (lhs: Item, rhs: Item) -> Bool {
        return lhs.name == rhs.name
    }
    
    static func < (lhs: Item, rhs: Item) -> Bool {
        return lhs.name < rhs.name
    }
    static func > (lhs: Item, rhs: Item) -> Bool {
        return lhs.name > rhs.name
    }
}

class TreeNode {
    var nodeItems : [Item] = []
    var left: TreeNode?
    var right: TreeNode?
    
    func add(_ item: Item) {
        
        if (self.nodeItems.count == 0) {
            print("self.nodeItems.count == 0")
            self.nodeItems.append(item)
            return
            
        } else {
            print("self.nodeItems.count > 0")
            if ( self.nodeItems.first! == item) {
                print("self.nodeItems.first! == item")
                self.nodeItems.append(item)
                return
            } else if (self.nodeItems.first! < item) {
                print("self.nodeItems.first! < item")
                if self.left != nil {
                    self.left!.add(item)
                    return
                } else {
                    self.left? = TreeNode()
                    self.left!.nodeItems.append(item)
                    return
                }
            }
            else if (self.nodeItems.first! > item) {
                print("self.nodeItems.first! > item")
                if self.right != nil {
                    self.right!.add(item)
                    return
                } else {
                    self.right? = TreeNode()
                    self.right!.nodeItems.append(item)
                    return
                }
            }
        }
    }
}

class ItemService {
    
    static let instance = ItemService()
    
    lazy var items : TreeNode = { [weak self] in
        if let node = self?.items {
            return node
        }
        return TreeNode()
        }()
    
    
    func prepareJsonContent()-> Data? {
        
        let jsonArray = [["id": "someId1", "name": "soneName1", "description": "some Description 1"]
            //            ,
            //                         ["id": "someId2", "name": "soneName2", "description": "some Description 2"],
            //        ["id": "someId3", "name": "soneName3", "description": "some Description 3"],
            //        ["id": "someId4", "name": "soneName4", "description": "some Description 4"],
            //        ["id": "someId5", "name": "soneName5", "description": "some Description 5"],
            //        ["id": "someId6", "name": "soneName6", "description": "some Description 6"]
        ]
        
        do {
            return try JSONSerialization.data(withJSONObject: jsonArray, options: [])
        } catch {
            debugPrint(error as Any)
        }
        return nil
    }
    
    func getAllItems(_ json: Data) {
        
        do {
            let itemsArray : [Item] = try JSONDecoder().decode([Item].self, from: json)
            
            for item in itemsArray {
                self.items.add(item)
            }
            
        } catch {
            debugPrint(error as Any)
        }
    }
}

ItemService.instance.getAllItems(ItemService.instance.prepareJsonContent()!)
debugPrint(String(reflecting: type(of: ItemService.instance.items)))

