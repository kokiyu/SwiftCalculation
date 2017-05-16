//
//  ViewController.swift
//  SwiftCalculation
//
//  Created by xmt_lyt on 17/5/9.
//  Copyright © 2017年 xmt_lyt. All rights reserved.
//

import UIKit
import AudioToolbox


class ViewController: UIViewController {

    @IBOutlet weak var total: UILabel!
    var left:ArithmeticExpression = ArithmeticExpression.Number(0)
    var right:ArithmeticExpression = ArithmeticExpression.Number(0)
    var arithmetic:String = ""
    var  newValue:Bool = false
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
    }

    @IBAction func clean(_ sender: UIButton) {
        
        self.left = ArithmeticExpression.Number(0)
        self.right = ArithmeticExpression.Number(0)
        self.arithmetic = ""
        self.newValue = false
        self.total.text = "0"
        
    }
    
    
    @IBAction func oppositeNumber(_ sender: UIButton) {

        if self.total.text != "0"{
        
            let value = -Float(self.total.text!)!
            self.total.text = "\(value)"
            
        }
    }
    
    @IBAction func percentage(_ sender: UIButton) {
        
        if self.total.text != "0"{
                
        let value = Float(self.total.text!)! / 100
        
        self.total.text = "\(value)"
        }
        
    }
    
    @IBAction func dot(_ sender: numberButton) {
        
        if !(self.total.text?.contains("."))!{
            
           self.total.text =  sender.returnMyselfValue(origin:  self.total.text!)
            
        }
        
        
    }
    
    
    
    
    @IBAction func number(_ sender: numberButton) {
        
        if !newValue {
            if( self.total.text != "0") || sender.titleLabel?.text != "0"{
                self.total.text = sender.returnMyselfValue(origin: self.total.text!)
            }
            
        }
        else {
            self.total.text = sender.returnMyselfValue(origin: "0")
            newValue = !newValue

        }
     }
    
    
    
    @IBAction func arithmatic(_ sender: UIButton) {
        
        if !newValue && arithmetic != ""{
            self.Result(sender)
        }
        
        self.left = ArithmeticExpression.Number(Float(self.total.text!)!)
        
        if let value = sender.titleLabel?.text{
            switch  value {
            case "÷":
                self.arithmetic = "Division"
            case "x":
                self.arithmetic = "Multiplication"
            case "－":
                self.arithmetic = "Subtraction"
            case "+":
                self.arithmetic = "Addition"
                
            default:
                self.arithmetic = ""
            }
        }
      
        newValue = true
       // self.total.text = "0"
        
    }
    
    
    @IBAction func Result(_ sender: UIButton) {
        
     self.right = ArithmeticExpression.Number(Float(self.total.text!)!)
     
        let product:ArithmeticExpression
        
        switch self.arithmetic {
        case "Division":
          product = ArithmeticExpression.Division(self.left, self.right)
          case "Multiplication":
            product = ArithmeticExpression.Multiplication(self.left, self.right)
            case "Subtraction":
                product = ArithmeticExpression.Subtraction(self.left, self.right)
                case "Addition":
                  product = ArithmeticExpression.Addition(self.left, self.right)

        default:
         product = ArithmeticExpression.Number(0)
            
        }
        
      self.total.text = "\(evaluate(product))"
        
        var soundID:SystemSoundID = 0

        // 加载文件
        let fileUrl = NSURL(fileURLWithPath: Bundle.main.path(forResource: "meow", ofType: "mp3")!)
        AudioServicesCreateSystemSoundID(fileUrl, &soundID)
        
        // 播放短频音效
        AudioServicesPlayAlertSound(soundID)
    }
    
   

    @IBOutlet weak var clean: UIButton!
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

