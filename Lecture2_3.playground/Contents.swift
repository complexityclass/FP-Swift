//: Playground - noun: a place where people can play

import UIKit

/**
*  @author Valeriy Popov, Rambler&Co, 16-01-07 22:01:03
*
*  @brief Finding fixed point of a function
*         f(x) = x
*/

let tolerance = 0.0001

func isCloseEnough(x: Double, y: Double) -> Bool {
    return abs((x - y) / x) / x < tolerance
}

func fixedPoint(f: Double -> Double)(firstGuess: Double) -> Double {
    func iterate(guess: Double) -> Double {
        let next = f(guess)
        if isCloseEnough(guess, y: next) {
            return next
        } else {
            return iterate(next)
        }
    }
    
    return iterate(firstGuess)
}

let fixed = fixedPoint({ x in 1 + x / 2})(firstGuess: 1)
print(fixed)


//sqrt(x) is a fixed point of the function y = x / y

func sqrt1(x: Double) -> Double {
    return fixedPoint({ y in (y + x / y) / 2})(firstGuess: 1)
}
sqrt1(2)


func averageDamp(f: Double -> Double)(x: Double) -> Double {
    return (x + f(x)) / 2
}


func sqrt2(x: Double) -> Double {
    return fixedPoint(averageDamp({ y in x / y}))(firstGuess: 1)
}

sqrt2(2)