//
//  sampleView.swift
//  CalendarKitDemo
//
//  Created by Kush Taneja on 02/03/17.
//  Copyright © 2017 Hyper. All rights reserved.
//

import UIKit

class sampleView: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        addCircleView()
       
               // Do any additional setup after loading the view.
    }
 

    @IBAction func createToast(_ sender: UIButton) {
        self.view.makeToast(message: "TastyToast for iOS is coming")
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func addCircleView() {
        let diceRoll = CGFloat(Int(arc4random_uniform(7))*50)
        var circleWidth = CGFloat(200)
        var circleHeight = circleWidth
        
        // Create a new CircleView
        
        var circleView = AnimatedCircle(frame: CGRect(x:self.view.bounds.midX-circleWidth/2, y: self.view.bounds.midY, width: circleWidth, height: circleHeight))
        
        view.addSubview(circleView)
        
        // Animate the drawing of the circle over the course of 1 second
        circleView.animateCircle(duration: 1.0)
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
