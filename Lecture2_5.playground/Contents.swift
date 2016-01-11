//: Playground - noun: a place where people can play

import UIKit

struct Rational: CustomStringConvertible {
    let numer: Int
    let denom: Int
    
    var description: String {
        return "\(numer)/\(denom)"
    }
    
    func add(r: Rational) -> Rational {
        return Rational(numer: numer * r.denom + r.numer * denom, denom: r.denom * denom)
    }
    
    func sub(r: Rational) -> Rational {
        return add(r.neg())
    }
    
    func neg() -> Rational {
        return Rational(numer: -numer, denom: denom)
    }
}

func +(left: Rational, right: Rational) -> Rational {
    return Rational(numer: left.numer * right.denom + right.numer * left.denom,
                    denom: right.denom * left.denom)
}

func -(left: Rational, right: Rational) -> Rational {
    let negativeRight = right.neg()
    return left + negativeRight
}


let r1 = Rational(numer: 1,denom: 2)
let r2 = Rational(numer: 2, denom: 3)
let r3 = r1 + r2
r3.add(r2)

let x = Rational(numer: 1, denom: 3)
let y = Rational(numer: 5, denom: 7)
let z = Rational(numer: 3, denom: 2)

let result = x - y - z
let result2 = x.sub(y).sub(z)