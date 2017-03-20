//
//  AnimatedCircle.swift
//  CalendarKitDemo
//
//  Created by Kush Taneja on 02/03/17.
//  Copyright © 2017 Hyper. All rights reserved.
//

import UIKit
import QuartzCore

class AnimatedCircle: UIView{
    
    var circleLayer: CAShapeLayer!
    var eyeCircleLayer: CAShapeLayer!
    var rightEyeCircleLayer: CAShapeLayer!

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.clear
        
        // Use UIBezierPath as an easy way to create the CGPath for the layer.
        // The path should be the entire circle.
        let circlePath = UIBezierPath(arcCenter: CGPoint(x: frame.size.width / 2.0, y: frame.size.height / 2.0), radius: (frame.size.width - 10)/2, startAngle: CGFloat(M_PI), endAngle: CGFloat(M_PI * 2.0), clockwise: false)
        let eyeCirclePath = UIBezierPath(arcCenter: CGPoint(x: frame.size.width / 4.0, y: (frame.size.height / 4.0)), radius: (frame.size.width - 10)/20, startAngle: 0, endAngle: CGFloat(M_PI * 2.0), clockwise: false)
        let rightEyeCirclePath = UIBezierPath(arcCenter: CGPoint(x: 3*(frame.size.width / 4.0), y: frame.size.height / 4.0), radius: (frame.size.width - 10)/20, startAngle: 0, endAngle: CGFloat(M_PI * 2.0), clockwise: false)
        
        
        // Setup the CAShapeLayer with the path, colors, and line width
        circleLayer = CAShapeLayer()
        circleLayer.path = circlePath.cgPath
        circleLayer.fillColor = UIColor.clear.cgColor
        circleLayer.strokeColor = UIColor.black.cgColor
        circleLayer.lineWidth = 1;
        
        // Don't draw the circle initially
        circleLayer.strokeEnd = 0.0
        
        eyeCircleLayer = CAShapeLayer()
        eyeCircleLayer.path = eyeCirclePath.cgPath
        eyeCircleLayer.fillColor = UIColor.black.cgColor
        eyeCircleLayer.strokeColor = UIColor.black.cgColor
        eyeCircleLayer.lineWidth = 2;
        eyeCircleLayer.isHidden = true

        
        rightEyeCircleLayer = CAShapeLayer()
        rightEyeCircleLayer.path = rightEyeCirclePath.cgPath
        rightEyeCircleLayer.fillColor = UIColor.black.cgColor
        rightEyeCircleLayer.strokeColor = UIColor.black.cgColor
        rightEyeCircleLayer.lineWidth = 2;
        rightEyeCircleLayer.isHidden = false
        
        // Don't draw the circle initially
        eyeCircleLayer.strokeEnd = 0.0
        rightEyeCircleLayer.strokeEnd = 0.0
        
        // Add the circleLayer to the view's layer's sublayers
        layer.addSublayer(circleLayer)
        layer.addSublayer(eyeCircleLayer)
        layer.addSublayer(rightEyeCircleLayer)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func animateCircle(duration: TimeInterval) {
        circleLayer.strokeEnd = 0.0
        // We want to animate the strokeEnd property of the circleLayer
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        
        // Set the animation duration appropriately
        animation.duration = duration
        
        // Animate from 0 (no circle) to 1 (full circle)
        animation.fromValue = 0
        animation.toValue = 1
        
        // Do a linear animation (i.e. the speed of the animation stays the same)
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        
        
        // Set the circleLayer's strokeEnd property to 1.0 now so that it's the
        // right value when the animation ends.
        circleLayer.strokeEnd = 1.0
        CATransaction.begin()
        CATransaction.setAnimationDuration(2)
         CATransaction.setCompletionBlock {
         self.eyeCircleLayer.isHidden = false
         self.eyeCircleLayer.strokeEnd = 1.0
         self.eyeCircleLayer.add(animation, forKey: "animateCircle")
         self.rightEyeCircleLayer.isHidden = true
         self.rightEyeCircleLayer.strokeEnd = 1.0
         self.rightEyeCircleLayer.isHidden = false
         self.rightEyeCircleLayer.add(animation, forKey: "animateCircle")
         debugPrint("Yuhu")
        }
        circleLayer.add(animation, forKey: "animateCircle")
        self.rightEyeCircleLayer.isHidden = true
        self.rightEyeCircleLayer.setNeedsLayout()
        CATransaction.commit()
        
        // Do the actual animation
    }
    
    func animateEyeCircle(duration: TimeInterval) {
        eyeCircleLayer.strokeEnd = 0.0
        // We want to animate the strokeEnd property of the circleLayer
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        
        // Set the animation duration appropriately
        animation.duration = duration
        
        // Animate from 0 (no circle) to 1 (full circle)
        animation.fromValue = 0
        animation.toValue = 1
        
        // Do a linear animation (i.e. the speed of the animation stays the same)
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        
        
        // Set the circleLayer's strokeEnd property to 1.0 now so that it's the
        // right value when the animation ends.
        eyeCircleLayer.strokeEnd = 1.0
        CATransaction.begin()
        CATransaction.setAnimationDuration(2)
        CATransaction.setCompletionBlock {
            debugPrint("Nuhu")
        }
        eyeCircleLayer.add(animation, forKey: "animateCircle")
        CATransaction.commit()
        // Do the actual animation
    }


}
