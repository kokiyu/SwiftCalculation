//
//  numberValue.swift
//  SwiftCalculation
//
//  Created by xmt_lyt on 17/5/10.
//  Copyright © 2017年 xmt_lyt. All rights reserved.
//

import Foundation

protocol NumberValue{
    
    // 对于属性，不能有初始值
    var number: Float{ get set }
    var origin: Float{ get }
}
