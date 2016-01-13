//: Playground - noun: a place where people can play

import UIKit

/**
*  @author Valeriy Popov, Rambler&Co, 16-01-13 20:01:20
*
*  @brief Exercise 1: Pascal’s Triangle
*/

func pascal(column: Int, _ row: Int) -> Int {
    
    let result: Int = {
        switch(column, row){
        case(0, _): return 1
        case(column, row) where column == row: return 1
        default: return pascal(column - 1, row - 1) + pascal(column, row - 1)
        }
    }()
    
    return result
}

pascal(0, 2)
pascal(1, 2)
pascal(1, 3)
pascal(2, 4)