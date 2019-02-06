// Playground - noun: a place where people can play

import UIKit

var numberList : Array<Int> = [8,41,54,0,-3, 2, 10, 9, 11, 1, 7, 3, 4]

func bubbleSort(var a: Array<Int>) -> Array<Int>
{
    var  temp, passes, key : Int

    for  i in 0..<a.count
    {
        passes = (a.count - 1) - i
        for j in 0..<passes
        {
            key = a[j]
            if (key > a[j + 1])
            {
                temp = a[j + 1]
                a[j + 1] = key
                a[j] = temp
           
            }
        }
    }
    return a
}

bubbleSort(numberList)
println(numberList)
