// Playground - noun: a place where people can play

import UIKit

var numberList : Array<Int> = [8,41,54,0,-3, 2, 10, 9, 11, 1, 7, 3, 4]

func quicksort(a:Array<Int>) -> Array<Int> {
    if a.count == 0 {
        return []
    }
    
    let pivot = a[0]
    let smallerArray = filter(a, { $0 < pivot })
    let greaterArray = filter(a, { $0 > pivot})
    
    return quicksort(smallerArray) + Array(arrayLiteral:pivot) + quicksort(greaterArray)
}

quicksort(numberList)
println(numberList)