//
//  GraphView.swift
//  InputV2
//
//  Created by Daniel Osvath on 8/31/15.
//  Copyright (c) 2015 Daniel Osvath. All rights reserved.
//

import UIKit

class GraphView: UIView {
    
   
    let xLabels = [1,2,3,4,5]
    let yLabels = [10,20,30,40,50,60,70,80,90]
    
    let labelFontSize:CGFloat = 20
    
    let xLabelHeight:CGFloat = 30;
    let xLabelWidth:CGFloat = 67;
    
    let yLabelHeight:CGFloat = 61;
    let yLabelWidth:CGFloat = 25;
    
    var yAxisPadding:CGFloat = 0;
    var xAxisPadding:CGFloat = 0;
    
    override func draw(_ rect: CGRect){
        
        yAxisPadding = yLabelWidth + yLabelWidth/2
        xAxisPadding = xLabelHeight + xLabelHeight/2
        
        drawAxisLines()
        labelXAxis(xLabels)
        labelYAxis(yLabels)

    }
    
    

    fileprivate func labelXAxis(_ labels: [Int]){
        
        let xAxisLength = bounds.width - yAxisPadding;
        let yAxisLength = bounds.height - xAxisPadding;
        let segmentLength = Int(xAxisLength) / labels.count;
        
        let xLabelY = CGFloat(yAxisLength + xLabelHeight/4)
        
        for i in 0  ..< labels.count {
            
            let currentX: CGFloat = CGFloat(i*segmentLength) + yAxisPadding
            
            let label = UILabel(frame: CGRect(x: currentX, y: CGFloat(xLabelY), width: xLabelWidth, height: xLabelHeight)) // (x,y,width,height)
            
            label.font =  label.font.withSize(labelFontSize)
            label.backgroundColor = UIColor.green;
            label.textAlignment = NSTextAlignment.center
            label.text = String(labels[i])
            label.isUserInteractionEnabled = true;
            self.addSubview(label)
            
            //hashmarks
            
            let hashmarkX = currentX + xLabelWidth/2
            
            let start:CGPoint = CGPoint(x:hashmarkX, y: CGFloat(xLabelY))
            let stop:CGPoint = CGPoint(x: hashmarkX, y: yAxisLength)
            
            let path = UIBezierPath()
            path.move(to: start)
            path.addLine(to: stop)
            UIColor.black.setStroke()
            
            path.stroke()
            
            //grid 
     
            let currentPoint:CGPoint = CGPoint(x: hashmarkX, y: CGFloat(yAxisLength))
            
            drawGridLine(currentPoint,axis: "x",axislength: Int(yAxisLength))
            
        }
        
    }
    
    fileprivate func labelYAxis(_ labels: [Int]){
        
        let xAxisLength = bounds.width - yAxisPadding;
        let yAxisLength = bounds.height - xAxisPadding;
        let segmentLength = Int(yAxisLength) / labels.count;
        
        let yLabelX = CGFloat(yLabelWidth/4); // x coordinates for label
        
        
        for i in 0  ..< labels.count {
            
            let currentY = CGFloat(i*segmentLength)
            
            let label = UILabel(frame: CGRect(x: yLabelX, y: currentY, width: yLabelWidth, height: yLabelHeight)) // (x,y,width,height)
            
            label.font =  label.font.withSize(labelFontSize)
            label.backgroundColor = UIColor.green;
            label.textAlignment = NSTextAlignment.center
            label.text = String(labels[labels.count-1-i])
            label.isUserInteractionEnabled = true; 
            self.addSubview(label)
            
            //hashmarks
            
            let hashmarkY = currentY + yLabelHeight/2 //y coordinte for current hashmark
            
            let start:CGPoint = CGPoint(x: yAxisPadding - yLabelWidth/4, y: hashmarkY)
            let stop:CGPoint = CGPoint(x: yAxisPadding, y: hashmarkY)
            
            let path = UIBezierPath()
            path.move(to: start)
            path.addLine(to: stop)
            UIColor.black.setStroke()
            
            path.stroke()
            
            // grid
            
            let currentPoint = CGPoint(x: yAxisPadding, y: hashmarkY)
            drawGridLine(currentPoint, axis: "y", axislength: Int(xAxisLength))

            
        }
        
    }
        
        
        
    fileprivate func drawGridLine(_ StartPoint: CGPoint, axis: String, axislength: Int){
            
            let path = UIBezierPath()
            path.move(to: StartPoint)
            UIColor.gray.setStroke()
            if axis == "x"{
                path.addLine(to: CGPoint(x: StartPoint.x, y: CGFloat(StartPoint.y - CGFloat(axislength))))
                
            }else{
                path.addLine(to: CGPoint(x: CGFloat(StartPoint.x + CGFloat(axislength)), y: StartPoint.y))
            }

            path.stroke()
            
    }
    
    
    fileprivate func drawAxisLines(){
    
    let origin:CGPoint = CGPoint(x: yAxisPadding, y: bounds.height - xAxisPadding)
    let yEnd:CGPoint = CGPoint(x: origin.x, y: 0)
    let xEnd:CGPoint = CGPoint(x: bounds.width, y: origin.y)
    
    let path = UIBezierPath()
    path.move(to: origin)
    path.addLine(to: yEnd)
    path.move(to: origin)
    path.addLine(to: xEnd)
    
    path.stroke()
        
    }
    

}
