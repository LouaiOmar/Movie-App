//
//  PlaySign.swift
//  Movie App
//
//  Created by Louai on 9/8/20.
//  Copyright © 2020 Louai. All rights reserved.
//

import UIKit

class PlaySign: UIView {
    
    var path: UIBezierPath!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    

    
    
    override func draw(_ rect: CGRect) {
           let path1 = UIBezierPath(ovalIn: CGRect(x: self.frame.size.width/2 - self.frame.size.height/2,
                         y: 0.0,
                         width: self.frame.size.height,
                         height: self.frame.size.height))
            let shapeLayer1 = CAShapeLayer()
            shapeLayer1.path = path1.cgPath
        shapeLayer1.fillColor = UIColor.clear.cgColor
        shapeLayer1.lineWidth = 5
        shapeLayer1.strokeColor = UIColor.white.cgColor
            self.backgroundColor = nil
            self.layer.addSublayer(shapeLayer1)
        
        let path2 = UIBezierPath()
        path2.move(to: CGPoint(x: self.frame.width*0.3, y: self.frame.size.height*0.2))
        path2.addLine(to: CGPoint(x: self.frame.width*0.3, y: self.frame.size.height*0.8))
        path2.addLine(to: CGPoint(x: self.frame.size.width*0.8, y: self.frame.size.height/2))
        path2.close()
        
         let shapeLayer2 = CAShapeLayer()
            shapeLayer2.path = path2.cgPath
        shapeLayer2.fillColor = UIColor.white.cgColor
        shapeLayer1.addSublayer(shapeLayer2)


    }
    
   
}
