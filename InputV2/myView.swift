//
//  myView.swift
//  InputV2
//
//  Created by Daniel Osvath on 9/25/15.
//  Copyright © 2015 Daniel Osvath. All rights reserved.
//

import UIKit

class myView: UIView {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
     override init(frame: CGRect){
        super.init(frame: frame)
        //  self.backgroundColor = UIColor.clearColor()
    }
    
    
    var tappoint: CGPoint!
    var touched = false
    var linecolorX = UIColor.blue
    var linecolorY = UIColor.blue
    
    override func draw(_ rect: CGRect) {
        
        if(touched){
            
            let xAxispoint: CGPoint = CGPoint(x: tappoint.x, y: frame.height)
            let vertical = UIBezierPath()
            vertical.move(to: tappoint)
            vertical.addLine(to: xAxispoint)
            vertical.lineWidth = 2;
            linecolorY.setStroke()
            vertical.stroke()
            
            let yAxispoint: CGPoint = CGPoint(x: 0, y: tappoint.y)
            let horizontal = UIBezierPath()
            horizontal.move(to: tappoint)
            horizontal.addLine(to: yAxispoint)
            horizontal.lineWidth = 2; 
            linecolorX.setStroke()
            horizontal.stroke()
            
        }
    }
    
}
