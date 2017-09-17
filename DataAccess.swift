//
//  DataAccess.swift
//  Persistent countDown Timer
//
//  Created by Manolescu Mihai Alexandru on 16/09/2017.
//  Copyright © 2017 Manolescu Mihai Alexandru. All rights reserved.
//

import Foundation
import UIKit

var accessDate = NSDate()
var intCounter = Int()
var timer = Timer()



func getDifference() -> Int
{
    var diff = Int()
    diff = Int(accessDate.timeIntervalSinceNow)
    diff *= (-1)
    
    return diff
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



