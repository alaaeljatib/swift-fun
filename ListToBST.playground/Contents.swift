
// Definition for singly-linked list.
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

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
    func sortedListToBST(_ head: ListNode?) -> TreeNode? {
        guard let _ = head else {return nil}
        
        var slowPointer: ListNode? = head
        var fastPointer: ListNode? = head
        
        while slowPointer != nil && fastPointer != nil && fastPointer!.next != nil {
            slowPointer = slowPointer!.next
            fastPointer = fastPointer!.next!.next
        }
        
        let root = TreeNode(slowPointer!.val)
        
        var pointer = head
        
        while pointer != nil {
            addToBst(root, pointer!.val)
            pointer = pointer!.next
        }
        return root
    }
    
    func addToBst(_ root: TreeNode?,_ val: Int) {
        guard let root = root, root.val != val else {return }
        
        if val < root.val {
            if root.left == nil {
                root.left = TreeNode(val)
            } else {
                addToBst(root.left, val)
            }
            
        } else {
            if root.right == nil {
                root.right = TreeNode(val)
            } else {
                addToBst(root.right, val)
            }
        }
    }
}
