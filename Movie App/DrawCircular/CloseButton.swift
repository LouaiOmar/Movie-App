//
//  CloseButton.swift
//  Movie App
//
//  Created by Louai on 9/4/20.
//  Copyright © 2020 Louai. All rights reserved.
//

import UIKit

class CloseButton: UIButton {

   @IBInspectable var fillColor: UIColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
    
    private var quarterWidth: CGFloat {
        return self.frame.size.width / 4
    }
      
    private var quarterHeight: CGFloat {
        return self.frame.size.height / 4
    }
     

    override func draw(_ rect: CGRect) {
      let path = UIBezierPath(ovalIn: rect)
      fillColor.setFill()
      path.fill()
        let plusWidth = min(bounds.width, self.frame.size.height)
          * Constants.plusButtonScale
        let halfPlusWidth = plusWidth / 2
        let plusPath = UIBezierPath()
        plusPath.lineWidth = Constants.plusLineWidth
        plusPath.move(to: CGPoint(
            x: quarterWidth * 1.5 - halfPlusWidth + Constants.halfPointShift,
          y: quarterHeight + Constants.halfPointShift))
        plusPath.addLine(to: CGPoint(
            x: quarterWidth * 2.5 + halfPlusWidth + Constants.halfPointShift,
          y: quarterHeight * 3 + Constants.halfPointShift))
        plusPath.move(to: CGPoint(
            x: quarterWidth * 2.5 + halfPlusWidth + Constants.halfPointShift,
            y: quarterHeight + Constants.halfPointShift))
        plusPath.addLine(to: CGPoint(
            x: quarterWidth * 1.5 - halfPlusWidth + Constants.halfPointShift,
          y: quarterHeight * 3 + Constants.halfPointShift))
        UIColor.black.setStroke()
        plusPath.stroke()
        
        
    }
    
    private struct Constants {
      static let plusLineWidth: CGFloat = 1.0
      static let plusButtonScale: CGFloat = 0.5
      static let halfPointShift: CGFloat = 0.5
    }
      

    
}



