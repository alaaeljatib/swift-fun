//
//  binary search tree in swift
//
//
//  Created by http://waynewbishop.com/swift/binary-search-trees/   2015
//
//
public class AVLTree<T: Comparable>
{
    var key: T?
    var left: AVLTree?
    var right: AVLTree?
    
    //add item based on its value
    func addNode(key: T)
    {
        
        //check for the head node
        if (self.key == nil)
        {
            self.key = key
            return
        }
        //check the left side of the tree
        if (key < self.key)
        {
            if (self.left != nil)
            {
                left!.addNode(key)
            }
            else
            {
                //create a new left node
                var leftChild : AVLTree = AVLTree()
                leftChild.key = key
                self.left = leftChild
            }
        }//end if
        //check the left side of the tree
        if (key > self.key)
        {
            if (self.right != nil)
            {
                right!.addNode(key)
            }
            else
            {
                //create a new right node
                var rightChild : AVLTree = AVLTree()
                rightChild.key = key
                self.right = rightChild
            }
        }//end if
    }//end function
    //retrieve the height of a node 
    func getNodeHeight(aNode: AVLTree!) -> Int
    { if (aNode == nil)
    {
        return -1
    } else
    {
        return aNode.height
        }
    }
    //calculate the height of a node 
    func setNodeHeight() -> Bool {
        //check for a nil condition 
        if (self.key == nil)
        {
            println("no key provided..")
            return false
        }
        //set height variable 
        var nodeHeight: Int = 0
        //compare and calculate node height 
        nodeHeight = max(getNodeHeight(self.left), getNodeHeight(self.right)) + 1
        self.height = nodeHeight
        return true
    }
    func isTreeBalanced() -> Bool {
        //check for a nil condition 
        if (self.key == nil)
        {
            println("no key provided..")
            return false }
        //use absolute value to calculate right / left imbalances 
        if (abs(getNodeHeight(self.left) - getNodeHeight(self.right)) <= 1)
        { return true
        }
        else
        {
            return false
        }
    } //end function 
   
} //end class