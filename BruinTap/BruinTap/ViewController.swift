//
//  ViewController.swift
//  BruinTap
//
//  Created by Nina Maller on 1/17/18.
//  Copyright © 2018 Nina Maller. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //properties
    var score = 0
    var timer: Timer!
    var time: Double = 10
    
    @IBOutlet var startButton: UIButton!
    @IBOutlet var tapButton: UIButton!
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var timeLabel: UILabel!
    
    //methods
    
    @objc func timerAction(){
        time -= 0.01
        timeLabel.text = String(format: "%.2f", time)
        
        if time <= 0 {
            timer.invalidate()
            timeLabel.text = "0.00"
            
            startButton.isEnabled = true
            tapButton.isEnabled = false
        }
    }
    @IBAction func tappedTapButton(_ sender: UIButton) {
        score += 1
        scoreLabel.text = String(score)
    }
    
    @IBAction func tappedStartButton(_ sender: UIButton) {
        score = 0
        scoreLabel.text = String(score)
        time = 10
        timeLabel.text = String(format: "%.2f", time)
        
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
        
        startButton.isEnabled = false
        tapButton.isEnabled = true
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tapButton.isEnabled = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

