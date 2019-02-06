// Playground - noun: a place where people can play

import UIKit

var numberList : Array<Int> = [8,8,8,9,8,3,2,1,3,4,5,6,2,1,7,6,8,5,9,12,11,41,54,0,-3, 2, 10, 9, 11, 1, 7, 3,10]

func  findoddFrequentItems (a : Array<Int>) -> Array<Int>
{
    var returnedArray : Array<Int> = []
if a.count < 2
{
    return a
    }
for x in a
{
    if itemFrequent(a,x) % 2 != 0 && !contains(returnedArray, x)
    {
    returnedArray.append(x)
    }
}
    return returnedArray
}

func itemFrequent(a : Array<Int>,x : Int) -> Int
{
    
    var count = 0
    for i in a
    {
        if i == x
        {
            count++
        }
        
    }
    
    return count
}

findoddFrequentItems(numberList)