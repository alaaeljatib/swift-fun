
 // Definition for a binary tree node.
  public class TreeNode {
     public var val: Int
      public var left: TreeNode?
      public var right: TreeNode?
      public init(_ val: Int) {
          self.val = val
          self.left = nil
          self.right = nil
      }
  }
 
class Solution {
    func findBottomLeftValue(_ root: TreeNode?) -> Int {
        guard let root = root else {return -1}
        
        var q :[TreeNode] = [root]
        
        var res = -1
        
        while !q.isEmpty {
            
            for i in 0..<q.count {
                if i == 0 {
                    res = q.first!.val
                }
                
                let cur = q.first;
                q.remove(at:0)
                if cur!.left != nil {
                    q.append(cur!.left!)
                }
                if cur!.right != nil {
                    q.append(cur!.right!)
                }
            }
        }
        
        return res
    }
    
    
}
