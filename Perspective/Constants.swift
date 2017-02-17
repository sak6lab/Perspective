//
//  Constants.swift
//  Perspective
//
//  Created by Saketh D on 2/2/17.
//  Copyright © 2017 Saketh D. All rights reserved.
//

import Foundation
import FirebaseDatabase
import UIKit

let API_KEY = "cab6eede7fe24dd8b9c31dcb88d176d5"
var ref = FIRDatabase.database().reference()

enum categories: Int{
    case Business = 0
    case Entertainment
    case Gaming
    case General
    case Music
    case ScienceAndNature
    case Sport
    case Technology
    
    var apiValue: String{
        switch(self){
        case .Business:
            return "business"
        case .Entertainment:
            return "entertainment"
        case .Gaming:
            return "gaming"
        case .General:
            return "general"
        case .Music:
            return "music"
        case .ScienceAndNature:
            return "science-and-nature"
        case .Sport:
            return "sport"
        case .Technology:
            return "technology"
        }
    }
    
}

let PAPAYA = UIColor(red: 226/255, green: 78/225, blue: 66/255, alpha: 1)
let MUSTARD = UIColor(red: 223/255, green: 176/255, blue: 0, alpha: 1)
let BLUSH = UIColor(red: 235/255, green: 110/255, blue: 128/255, alpha: 1)
let AQUA = UIColor(red: 0, green: 143/255, blue: 129/255, alpha: 1)