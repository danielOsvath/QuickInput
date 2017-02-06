//
//  DrawLines.swift
//  InputV2
//
//  Created by Daniel Osvath on 9/18/15.
//  Copyright (c) 2015 Daniel Osvath. All rights reserved.
//

import UIKit

class DrawLines: UIView{
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect){
        super.init(frame: frame)
      //  self.backgroundColor = UIColor.clearColor()
    }
    
    
    var tappoint: CGPoint!
    var touched = false
    
    
    override func draw(_ rect: CGRect) {
        

        if(touched){

            let xAxispoint: CGPoint = CGPoint(x: tappoint.x,y: frame.height-8)
            let vertical = UIBezierPath()
            vertical.move(to: tappoint)
            vertical.addLine(to: xAxispoint)
            UIColor.blue.setStroke()
            vertical.stroke()
            
            let yAxispoint: CGPoint = CGPoint(x: 8, y: tappoint.y)
            let horizontal = UIBezierPath()
            horizontal.move(to: tappoint)
            horizontal.addLine(to: yAxispoint)
            UIColor.blue.setStroke()
            horizontal.stroke()
            
        }
    }
    
}
