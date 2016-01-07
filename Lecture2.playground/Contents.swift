//: Playground - noun: a place where people can play

import UIKit

// Sum of ints first version
func sumInts(f: Int -> Int) -> (Int, Int) -> Int {
    func sumF(a: Int, b: Int) -> Int {
        if a > b {
            return 0
        } else {
            return f(a) + sumF(a + 1, b: b)
        }
    }
    
    return sumF
}

let cube: Int -> Int = { num in num * num * num }
sumInts(cube)(1,4)


//Sum of ints second version
func sum(f: Int -> Int)(a: Int, b: Int) -> Int {
    if a > b {
        return 0
    } else {
        return f(a) + sum(f)(a: a + 1, b: b)
    }
}

sum(cube)(a: 1,b: 4)


//Product of ints
func product(f: Int -> Int)(_ a: Int, _ b: Int) -> Int {
    if a > b {
        return 1
    }else {
        return f(a) * product(f)(a + 1, b)
    }
}

//Write factorial in terms of product

func fact(n: Int) -> Int {
    return product({a in a})(1, n)
}

fact(5)


// Generalize sum and product 

func mapReduce(f: Int -> Int, combine: (Int, Int) -> Int, zero: Int)(_ a: Int, _ b: Int) -> Int {
    if a > b {
        return zero
    } else {
        return combine(f(a), mapReduce(f, combine: combine, zero: zero)(a + 1, b))
    }
}

let t = mapReduce({x in x}, combine: {x, y in x + y}, zero: 0)(1,3)
