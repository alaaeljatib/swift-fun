//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

func findAlInAlaa (alaa : String , al : String) -> Int
{
    if alaa.characters.count < al.characters.count
    {
        print(alaa.characters.count)
        print(al.characters.count)
        
        return -1
    } else
    {
        var i = 0
        while i < alaa.characters.count
        {
            if alaa[i] != al[0]
            {
                i++
                print(i)
            } else
            {
                 var w = 0
                var x = i
                    while  w < al.characters.count  && x < alaa.characters.count  &&
                        Array(arrayLiteral: al)[w] == Array(arrayLiteral: alaa)[x]

                {
                    w++
                    x++
                }
                if w == al.characters.count - 1
                {
                    return i
                } else
                {
                    i++
                }
                
            }
        }
    }
    
    return -1
}

print (findAlInAlaa("Suzan", al: "Suzan"))