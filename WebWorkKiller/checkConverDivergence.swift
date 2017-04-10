//
//  checkConverDivergence.swift
//  WebWorkKiller
//
//  Created by エリック on 2017/04/10.
//  Copyright © 2017年 エリック. All rights reserved.
//

import UIKit

class checkConverDivergence: UIViewController {
    
    
    var SequenceSeriesStatus = 0;
    
    @IBOutlet weak var foumulaField: UITextField!
    @IBOutlet weak var segment: UISegmentedControl!
    @IBOutlet weak var displayLabel: UILabel!
    @IBOutlet weak var answerDisplay: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        SequenceSeriesStatus = segment.selectedSegmentIndex
        answerDisplay.text = nil
    }

    
    
    
    

    @IBAction func SequenceSeriesSegment(_ sender: Any) {
        SequenceSeriesStatus = segment.selectedSegmentIndex
        if SequenceSeriesStatus == 0 {
            displayLabel.text = "a(n)="
        }else if SequenceSeriesStatus == 1{
            displayLabel.text = "∑a(n)=∑"
        }

    }

    
    @IBAction func calculateBtn(_ sender: Any) {
        
        if let fx = foumulaField.text?.replacingOccurrences(of: "^", with:"**") {
            if  (SequenceSeriesStatus == 0){
              sequenceConDiv(fx: fx)
            }else{
                SeriesConDiv(fx: fx)
            }
        }
    }
    
    
    func sequenceConDiv(fx: String){
        var n : Double = 9999999
        let variableN : [String : Double] = ["n": n]
        
        let limit = NSExpression(format : fx).expressionValue(with: variableN, context: nil) as! Double
        
        n += 1;
        
        let limit2 = NSExpression(format : fx).expressionValue(with: variableN, context: nil) as! Double
        
        
        if fabs(limit)-fabs(limit2) <= 0.1{
            answerDisplay.text = "Convergence"
        }else{
            answerDisplay.text = "Divergence"
        }
    }
    
    // this function needs to be fixed
    func SeriesConDiv(fx: String){
  
        var sum1 : Double = 0
        var sum2 : Double = 0
        
        let MaxNumOfTimes = 999
        for n in 1...MaxNumOfTimes{
            let variableN : [String : Int] = ["n": n]
            sum1 += NSExpression(format : fx).expressionValue(with: variableN, context: nil) as! Double

        }
        
        let variableN1 : [String : Int] = ["n": MaxNumOfTimes+1]
        
        sum2 = sum1 + (NSExpression(format: fx).expressionValue(with: variableN1, context: nil) as! Double)
        
        
        
        if fabs(sum1)-fabs(sum2) <= 0.1{
            answerDisplay.text = "Convergence"
        }else{
            answerDisplay.text = "Divergence"
        }
    }
    
    

    @IBAction func backBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }



}
