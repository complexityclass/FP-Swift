//: Playground - noun: a place where people can play

import UIKit

protocol IntSet {
    func incl(x: Int) -> IntSet
    func contains(x: Int) -> Bool
    func union(other: IntSet) -> IntSet
}

struct Empty: IntSet, CustomStringConvertible {
    
    func contains(x: Int) -> Bool {
        return false
    }
    
    func incl(x: Int) -> IntSet {
        return NonEmpty(x: x, left: Empty(), right: Empty())
    }
    
    func union(other: IntSet) -> IntSet {
        return other
    }
    
    var description: String {
        get {
            return "."
        }
    }
}

struct NonEmpty: IntSet, CustomStringConvertible {
    
    let value: Int
    let right: IntSet
    let left: IntSet
    
    init(x: Int, left: IntSet, right: IntSet) {
        self.value = x
        self.left = left
        self.right = right
    }
    
    func contains(x: Int) -> Bool {
        if x < value {
            return left.contains(value)
        } else if x > value {
            return right.contains(value)
        } else {
            return true
        }
    }
    
    func incl(x: Int) -> IntSet {
        if x < value {
            return NonEmpty(x: value, left: left.incl(x), right: right)
        } else if x > value {
            return NonEmpty(x: value, left: left, right: right.incl(x))
        } else {
            return self
        }
    }
    
    func union(other: IntSet) -> IntSet {
        return ((left.union(right)).union(other)).incl(value)
    }
    
    var description: String {
        get {
            return "{ \(left)  \(value)  \(right) }"
        }
    }
}


let t1 = NonEmpty(x: 3, left: Empty(), right: Empty())
let t2 = t1.incl(4)
let t3 = NonEmpty(x: 76, left: Empty(), right: Empty())
let t4 = (t1.union(t2)).union(t3)

