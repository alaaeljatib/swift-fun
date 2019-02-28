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

            self.nodeItems.append(item)
            return

        } else {

            if (self.nodeItems.first! == item) {
                self.nodeItems.append(item)
                return
            } else if (self.nodeItems.first! < item) {
                if let _ = self.left {
                    self.left!.add(item)
                    return
                } else {
                    self.left = TreeNode()
                    self.left!.nodeItems.append(item)
                    return
                }
            }
            else if (self.nodeItems.first! > item) {
                if let _ = self.right {
                    self.right!.add(item)
                    return
                } else {
                    self.right = TreeNode()
                    self.right!.nodeItems.append(item)
                    return
                }
            }
        }
    }
    
    func serializeTree(_ root : TreeNode?) {
        guard let root = root else {return}
        
        print(root.nodeItems)
        
        serializeTree(root.left)
        serializeTree(root.right)
    }
}

class ItemService {
    
    static let instance = ItemService()
    
     let items = TreeNode()
    
    
    func prepareJsonContent() -> Data? {
        
        let jsonArray = [["id": "someId1", "name": "soneName1", "description": "some Description 1"],
                    ["id": "someId2", "name": "soneName2", "description": "some Description 2"],
                    ["id": "someId0", "name": "soneName2", "description": "some Description 0"],
                    ["id": "someId3", "name": "soneName3", "description": "some Description 3"],
                    ["id": "someId4", "name": "soneName4", "description": "some Description 4"],
                    ["id": "someId5", "name": "soneName5", "description": "some Description 5"],
                    ["id": "someId6", "name": "soneName6", "description": "some Description 6"]
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
    
    func findItem(_ root: TreeNode?,_ name: String, id: String) -> Item? {
        
        guard let root = root, root.nodeItems.count > 0 else {return nil }
        
        if (root.nodeItems.first!.name == name) {
            return findItemInArray(root, id)
        } else if (root.nodeItems.first!.name < name) {
           return findItem(root.left, name, id: id)
        }
        
          return  findItem(root.right, name, id: id)
    }
    
    private func findItemInArray(_ root : TreeNode, _ id: String) -> Item? {
        for item in root.nodeItems {
            if (item.id == id) {
                return item
            }
        }
        return nil
    }
}

let jsonContent = ItemService.instance.prepareJsonContent()!
ItemService.instance.getAllItems(jsonContent)

ItemService.instance.items.serializeTree(ItemService.instance.items)
let item = ItemService.instance.findItem(ItemService.instance.items, "soneName2", id: "someId0")
print(item!)


