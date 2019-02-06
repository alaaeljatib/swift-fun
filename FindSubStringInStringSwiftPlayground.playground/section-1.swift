// Playground - noun: a place where people can play

import UIKit
func StringStartsWithStr (x: String , y: String ) -> Bool {
    if countElements(x) >= countElements(y)
    {
        var i = 0
        
        while Array(x)[i] == Array(y)[i] && i < countElements(y) - 1     {
            i += 1
        }
        if i == countElements(y) - 1
        {
            return true
        }
        return false
    } else
    {
        return false
    }
    
}

func findSubStrinString (x : String , y : String) -> Int
{
    if countElements(x) >= countElements(y)
    {
        for var i : Int = 0 ; i < countElements(x) ; i++
        {
            println(StringStartsWithStr((x as NSString).substringFromIndex(i),y))
            println((x as NSString).substringFromIndex(i))
            
            if StringStartsWithStr((x as NSString).substringFromIndex(i),y)
            {
                return i + 1
            }
        }
        
        return -1
    }
    else
    {return -1
    }
}

let d = findSubStrinString("AaaSuzanAlaa","Suzan")
println(d)
