//
//  definiteIntegral.swift
//  WebWorkKiller
//
//  Created by エリック on 2017/04/07.
//  Copyright © 2017年 エリック. All rights reserved.
//

import UIKit

class definiteIntegral: UIViewController {

    
    @IBOutlet weak var functions: UITextField!
    @IBOutlet weak var upperBound: UITextField!
    @IBOutlet weak var lowerBound: UITextField!
    
    
    @IBOutlet weak var NumN: UITextField!
    @IBOutlet weak var answerDisplay: UILabel!
    
    @IBOutlet weak var differentMethods: UISegmentedControl!
    
    var currentSegmentIndex = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        differentMethods.selectedSegmentIndex = 0;

    }

    
    
    @IBAction func calculateFunction(_ sender: Any) {
        UpdateSegmentIndex(sender)
        
        if let F = (functions.text)?.replacingOccurrences(of: "^", with:"**"), let a = Double(lowerBound.text!), let b = Double(upperBound.text!),let n = Double(NumN.text!), let deltaX: Double = (fabs(a)+fabs(b))/n {
            
            var sum : Double = 0
            print(deltaX)
            var answer :Double = 0
            switch(currentSegmentIndex){
            case 0: answer = RiemannSum_Left(F, b, a, deltaX, &sum)
            case 1: answer = RiemannSum_Right(F, b, a, deltaX, &sum)
            case 2: answer = Midpoint(F, b, a, deltaX, &sum)
            default : break
            }
            
        
            answerDisplay.text = String(answer)
        }else{
            print("error: please fill in the information properly")
        }
    }
    
    @IBAction func UpdateSegmentIndex(_ sender: Any) {
        currentSegmentIndex = differentMethods.selectedSegmentIndex
    }
    
    
    @IBAction func backBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    //TODO @ fix n = 3 issues
    
    func RiemannSum_Right(_ fx :String,_ upper: Double,_ Lower: Double,_ deltaX : Double ,_ sum: inout Double) -> Double{
        
        
        if (Lower >= upper){
            return sum
        }else{
            
            let variableX : [String : Double] = ["x": Lower+deltaX]
            
            let rect = (NSExpression(format: fx).expressionValue(with: variableX, context: nil) as! Double) * deltaX
            sum += rect
            return  RiemannSum_Right(fx, upper, (Lower+deltaX), deltaX, &sum)
            
        }
    }
    
    func RiemannSum_Left(_ fx :String,_ upper: Double,_ Lower: Double,_ deltaX : Double ,_ sum: inout Double) -> Double{
        
        
        if (upper <= Lower){
            return sum
        }else{
            
            let variableX : [String : Double] = ["x": upper-deltaX]
            
            let rect = (NSExpression(format: fx).expressionValue(with: variableX, context: nil) as! Double) * deltaX
            sum += rect
            return  RiemannSum_Left(fx, (upper-deltaX), Lower, deltaX, &sum)
            
        }
    }
    
    func Midpoint(_ fx :String,_ upper: Double,_ Lower: Double,_ deltaX : Double ,_ sum: inout Double) -> Double{
        if (Lower > upper){
            return sum
        }else{
            
            let variableX : [String : Double] = ["x": Lower+(deltaX/2)]
            
            let rect = (NSExpression(format: fx).expressionValue(with: variableX, context: nil) as! Double) * deltaX
            sum += rect
            return  Midpoint(fx, upper, (Lower+deltaX), deltaX, &sum)
            
        }
    }
    
    
    func SimpsonsRule(){
        // to be implemented ...
    }
    
  
}


