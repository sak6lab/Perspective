//
//  Constants.swift
//  Perspective
//
//  Created by Saketh D on 2/2/17.
//  Copyright © 2017 Saketh D. All rights reserved.
//

import Foundation

let API_KEY = "cab6eede7fe24dd8b9c31dcb88d176d5"

enum catagories: Int{
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
    
    var colorValue: colors{
        switch(self){
        case .Business:
            return colors.Papaya
        case .Entertainment:
            return colors.Mustard
        case .Gaming:
            return colors.Blush
        case .General:
            return colors.Aqua
        case .Music:
            return colors.Papaya
        case .ScienceAndNature:
            return colors.Mustard
        case .Sport:
            return colors.Blush
        case .Technology:
            return colors.Aqua
        }
    }
}

enum colors: Int{
    case Papaya = 0
    case Mustard
    case Blush
    case Aqua
    
    var hexValue: String{
        switch(self){
        case .Papaya:
            return "E24E42"
        case .Mustard:
            return "#E9B000"
        case .Blush:
            return "#EB9E80"
        case .Aqua:
            return "#008f95"
        }
    }
}
