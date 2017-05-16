//
//  calculateWay.swift
//  SwiftCalculation
//
//  Created by xmt_lyt on 17/5/10.
//  Copyright © 2017年 xmt_lyt. All rights reserved.
//

import Foundation

indirect enum ArithmeticExpression{
    
    case Number(Float)
    case Addition( ArithmeticExpression , ArithmeticExpression )
    case Multiplication( ArithmeticExpression , ArithmeticExpression )
    case Subtraction( ArithmeticExpression ,ArithmeticExpression)
    case Division(ArithmeticExpression ,ArithmeticExpression)
    
//    func evaluate(_ expression: ArithmeticExpression) -> Float {
//        switch expression {
//        case let .Number(value):
//            return value
//     
//        case let .Addition(left, right):
//            return evaluate(left) + evaluate(right)
//        
//        case let .Multiplication(left, right):
//            return evaluate(left) * evaluate(right)
//       
//        case let .Subtraction(left ,right):
//            return evaluate(left) - evaluate(right)
//        
//        case let .Division(left ,right):
//            return evaluate(left) - evaluate(right)
//            
//            
//        }
//    }
    
}
func evaluate(_ expression: ArithmeticExpression) -> Float {
    switch expression {
    case let .Number(value):
        return value
        
    case let .Addition(left, right):
        return evaluate(left) + evaluate(right)
        
    case let .Multiplication(left, right):
        return evaluate(left) * evaluate(right)
        
    case let .Subtraction(left ,right):
        return evaluate(left) - evaluate(right)
        
    case let .Division(left ,right):
        return evaluate(left) / evaluate(right)
        
    }
}

