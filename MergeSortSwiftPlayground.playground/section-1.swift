// Playground - noun: a place where people can play

import UIKit

var numberList : Array<Int> = [8,41,54,0,-3, 2, 10, 9, 11, 1, 7, 3, 4]
func mergreSort ( a: Array<Int>) -> Array<Int>
{
    if a.count < 2
    {
        return a
    }
    var center  = a.count/2
    return (mergeSortedArrays(mergreSort(Array(a[0..<center])) , mergreSort(Array(a[center..<a.count]))) )
}

func mergeSortedArrays (x : Array<Int> , y: Array<Int>) -> Array<Int>
{
    var i = 0 ,j = 0
    var returnedArray : Array<Int> = []
    while i < x.count && j < y.count
    {
        if x[i] < y[j]
        {
            returnedArray.append(x[i])
            i++
        } else if x[i] > y[j]
        {
            returnedArray.append(y[j])
            j++
        } else
        {
            returnedArray.append(x[i])
            i++
            returnedArray.append(y[j])
            j++
            
        }
    }
    
    returnedArray = returnedArray + x[i..<x.count]
    returnedArray = returnedArray + y[j..<y.count]
    return returnedArray
}

mergreSort(numberList)
println(numberList)
