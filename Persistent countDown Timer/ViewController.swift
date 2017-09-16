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
    var accessDate = NSDate()
    var intCounter = Int()
    var timer = Timer()
    
    @IBOutlet weak var timerDisplay: UILabel!

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        updateDate()
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCountdown), userInfo: nil, repeats: true)
    }
    
    
    
    func getDifference() -> Int
    {
        var diff = Int()
            diff = Int(accessDate.timeIntervalSinceNow)
            diff *= (-1)
        
        return diff
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

    
    func updateDate()
    {
        if UserDefaults.standard.value(forKey: "lastAccess") == nil
        {  // in this case, the variable is created and initialized for the first time:
            
            resetDate()
            accessDate = retrieveDate()
        }
            
        else
        {  //in this case, the variable already exists over there.
            accessDate = retrieveDate()
        }
        
        intCounter = getDifference()
    }
    
    
    
    func resetDate()
    {
        UserDefaults.standard.set(NSDate(), forKey: "lastAccess")
    }
    
    
    func retrieveDate() -> NSDate
    {
        var lastAccess = NSDate()
            lastAccess = UserDefaults.standard.object(forKey: "lastAccess") as? NSDate ?? NSDate.distantFuture as NSDate
    
        return lastAccess
    }
 
}



