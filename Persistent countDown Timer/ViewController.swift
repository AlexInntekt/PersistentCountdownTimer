//
//  ViewController.swift
//  Persistent countDown Timer
//
//  Created by Manolescu Mihai Alexandru on 16/09/2017.
//  Copyright © 2017 Manolescu Mihai Alexandru. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{

    
    @IBOutlet weak var timerDisplay: UILabel!

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        updateDate()
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCountdown), userInfo: nil, repeats: true)
    }
    

    
    func updateCountdown() {
        intCounter += 1
        
        //Set counter in UILabel
        timerDisplay.text! = String(format: "%02d:%02d:%02d", intCounter / 3600, (intCounter % 3600) / 60, (intCounter % 3600) % 60)
    }

    @IBOutlet weak var updateDisplay: UIButton!
    @IBAction func updateDisplay(_ sender: Any)
    {
        resetDate()
        updateDate()
        
        
        print("\n\n$$",accessDate,"$$\n\n")
    }

    
}



