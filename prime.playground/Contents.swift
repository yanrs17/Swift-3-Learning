//: Playground - noun: a place where people can play

import UIKit

/*
 1. Create random int
    -> arc4random_uniform(n)
 2. Function format
    -> func name_fn(param1: type, ...) -> result_type {...}
    e.g. func isPrime(number: Int) -> Bool {...}
 3. Get range
    -> x..<y
 */

func isPrime(number: Int) -> Bool {
    if number == 1 {
        return false
    }
    if number == 2 {
        return true

    }
    for i in 2..<number {
        if number % i == 0 {
            return false
        }
    }
    return true
}

isPrime(1)
isPrime(2)
isPrime(3)
isPrime(4)
isPrime(11)