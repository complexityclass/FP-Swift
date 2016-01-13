//: Playground - noun: a place where people can play

import UIKit

struct Rational: CustomStringConvertible {
    
    var numer: Int = 0
    var denom: Int = 1
    
    var description: String {
        let greatestCommonDivisior = gcd(numer, denom)
        return "\(numer / greatestCommonDivisior)/\(denom / greatestCommonDivisior)"
    }
    
    init?(numer: Int, denom: Int) {
        
        guard denom != 0 else {
            return nil
        }
        
        //assert(denom != 0)
        
        self.numer = numer
        self.denom = denom
    }
    
    init(value: Int) {
        numer = value
    }
    
    
    func max(that: Rational) -> Rational {
        return self < that ? that : self
    }
    
    private func gcd(a: Int, _ b: Int) -> Int {
        return b == 0 ? a : gcd(b, a % b)
    }
}



func + (left: Rational, right: Rational) -> Rational {
    return Rational(numer: left.numer * right.denom + right.numer * left.denom,
        denom: right.denom * left.denom)!
}

func - (left: Rational, right: Rational) -> Rational {
    let negativeRight = -right
    return left + negativeRight
}


prefix func - (r: Rational) -> Rational {
    return Rational(numer: r.numer, denom: r.denom)!
}

infix operator < { associativity right precedence 110 }
func < (left: Rational, right: Rational) -> Bool {
    return left.numer * right.numer < right.numer * left.denom
}


let a = Rational(numer: 24, denom: 6)!
let b = Rational(value: 4)

a < b

a + b

-b