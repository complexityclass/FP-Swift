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
    
    func add(r: Rational) -> Rational {
        return Rational(numer: numer * r.denom + r.numer * denom, denom: r.denom * denom)!
    }
    
    func sub(r: Rational) -> Rational {
        return add(r.neg())
    }
    
    func neg() -> Rational {
        return Rational(numer: -numer, denom: denom)!
    }
    
    func less(that: Rational) -> Bool {
        return numer * that.numer < that.numer * denom
    }
    
    func max(that: Rational) -> Rational {
        return self.less(that) ? that : self
    }
    
    
    
    private func gcd(a: Int, _ b: Int) -> Int {
        return b == 0 ? a : gcd(b, a % b)
    }
}

func +(left: Rational, right: Rational) -> Rational {
    return Rational(numer: left.numer * right.denom + right.numer * left.denom,
        denom: right.denom * left.denom)!
}

func -(left: Rational, right: Rational) -> Rational {
    let negativeRight = right.neg()
    return left + negativeRight
}

let a = Rational(numer: 24, denom: 6)

let b = Rational(value: 4)

