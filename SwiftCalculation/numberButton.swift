//
//  numberButton.swift
//  SwiftCalculation
//
//  Created by xmt_lyt on 17/5/10.
//  Copyright © 2017年 xmt_lyt. All rights reserved.
//

import UIKit

class numberButton: UIButton {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

     func returnMyselfValue(origin:String) -> String?{
        
        if Float(origin) != 0  {

            return "\(origin)" + (self.titleLabel?.text)!
            
           }
        else{
        return self.titleLabel?.text
        }
    }
    
   
    
    
}
