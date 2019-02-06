// Playground - noun: a place where people can play

import UIKit

var numberList : Array<Int> = [8,41,54,0,-3, 2, 10, 9, 11, 1, 7, 3, 4]
func insertSort(var a : Array<Int> ) -> Array <Int>
{
    var key : Int
    for var i = 0 ; i < a.count ; i++
    {
        key = a[i]
        for var j = i ; j > -1 ; j--
        {
            if key < a[j]
            {
                a.removeAtIndex( j+1)
                a.insert(key,atIndex : j)
            }
        }
    }
    
    return a
}


insertSort(numberList)
println(numberList)
