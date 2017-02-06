//
//  ViewController.swift
//  InputV2
//
//  Created by Daniel Osvath on 8/31/15.
//  Copyright (c) 2015 Daniel Osvath. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var lines: DrawLines!
    
    @IBOutlet weak var graphView: GraphView!
    
    var lineview: myView!;
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let xPos = graphView.frame.origin.x + graphView.yLabelWidth + graphView.yLabelWidth/2
        let yPos = graphView.frame.origin.y
       
        let lineViewWidth = CGFloat(315)
        let lineViewHeight = CGFloat(553)
        
        
        lineview = myView.init(frame: CGRect(x: xPos, y: yPos, width: lineViewWidth, height: lineViewHeight))


        //lines.backgroundColor = UIColor.blueColor();
        
//        lines.userInteractionEnabled = false
        
        self.view.addSubview(lineview)
        
        lineview.backgroundColor = UIColor.clear;
        
        lineview.isUserInteractionEnabled = false
        
        

      

    
        // Do any additional setup after loading the view, typically from a nib.
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBOutlet weak var display: UILabel!
    
    
    @IBAction func pan(_ sender: UIPanGestureRecognizer) {
        
        var coordinate = sender.location(in: view)
      
        display.text = "\(getCoordinatesAndHashes(coordinate).value)"
        
        
        let xHashmark = getCoordinatesAndHashes(coordinate).1
        let yHashmark = getCoordinatesAndHashes(coordinate).2
        
        let deltaX = abs(coordinate.x - xHashmark)
        let deltaY = abs(coordinate.y - yHashmark)
    
        if (xHashmark != 0.0  && deltaX <= 35) {
        
        coordinate = CGPoint(x: xHashmark, y: coordinate.y)
        lineview.linecolorY = UIColor.purple
    
        }else{
            lineview.linecolorY = UIColor.blue
        }
            
        if (yHashmark != 0.0 && deltaY <= 35){
            coordinate = CGPoint(x: coordinate.x, y: yHashmark)
            lineview.linecolorX = UIColor.purple
            
        }else{
            lineview.linecolorX = UIColor.blue
        }
        
        coordinate = view.convert(coordinate, to: lineview)
        lineview.touched = true
        
        
        lineview.tappoint = coordinate
        
        lineview.setNeedsDisplay()
        
    }
    
     @IBAction func tap(_ sender: UITapGestureRecognizer) {
        var coordinate = sender.location(in: view)
        
        display.text = "\(getCoordinatesAndHashes(coordinate).value)"
        
        
        let xHashmark = getCoordinatesAndHashes(coordinate).1
        let yHashmark = getCoordinatesAndHashes(coordinate).2
        
        let deltaX = abs(coordinate.x - xHashmark)
        let deltaY = abs(coordinate.y - yHashmark)
        
        if (xHashmark != 0.0  && deltaX <= 35) {
            
            coordinate = CGPoint(x: xHashmark, y: coordinate.y)
            lineview.linecolorY = UIColor.purple
            
        }else{
            lineview.linecolorY = UIColor.blue
        }
        
        if (yHashmark != 0.0 && deltaY <= 35){
            coordinate = CGPoint(x: coordinate.x, y: yHashmark)
            lineview.linecolorX = UIColor.purple
            
        }else{
            lineview.linecolorX = UIColor.blue
        }
        
        coordinate = view.convert(coordinate, to: lineview)
        lineview.touched = true
        
        
        lineview.tappoint = coordinate
        
        lineview.setNeedsDisplay()

    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("touches Ended");
    }
   
    func getCoordinatesAndHashes(_ point: CGPoint) -> (value: Double,xHash: CGFloat,yHash: CGFloat){
        
        var value = 0.0
        
        let xLabelY = graphView.frame.origin.y + graphView.bounds.height -  graphView.xLabelHeight
        
        let yLabelX = graphView.frame.origin.x + graphView.yLabelWidth
        
        //get xValue
        let xStringValue = getLabel(CGPoint(x: point.x, y: xLabelY)).0
        
        let xHashLocation = getLabel(CGPoint(x: point.x, y: xLabelY)).xCenter
        
        print(xHashLocation)
        
        //get yValue -> 0. + to Double
        let yStringValue = "0." + getLabel(CGPoint(x: yLabelX, y: point.y)).0
        
        let yHashLocation = getLabel(CGPoint(x: yLabelX, y: point.y)).yCenter
        
        if let val1 = Double(xStringValue){
            value += val1
        }else{
            value += 0
        }
        
        if let val2 = Double(yStringValue){
            value += val2
        }else{
            value += 0 ;
        }
        
        return (value,xHashLocation,yHashLocation)
    }
    
    func getLabel(_ location: CGPoint) -> (String,xCenter: CGFloat, yCenter: CGFloat){
        
        let selectedView = self.view.hitTest(location, with:nil)
        
        if let label = selectedView as? UILabel
        {
            let center = graphView.convert(label.center, to: view)
            
            return ((label.text!), center.x, center.y)
        }
        return ("", 0.0,0.0)
    }
    
}

