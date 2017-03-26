//
//  Category.swift
//  Perspective
//
//  Created by Saketh D on 3/20/17.
//  Copyright © 2017 Saketh D. All rights reserved.
//

import Foundation
import UIKit

class Category{
    private var _cat: categories
    
    var frequency: Int!
    
    init(cat: categories, frequency: Int){
        self._cat = cat
        self.frequency = frequency
    }
    
    var cat: categories{
        return _cat
    }
    
}
