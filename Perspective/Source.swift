//
//  Source.swift
//  Perspective
//
//  Created by Saketh D on 2/20/17.
//  Copyright © 2017 Saketh D. All rights reserved.
//

import UIKit

class Source{
    private var _id: String!
    private var _name: String!
    private var _description: String!
    private var _url: String!
    private var _category: String!
    private var _urlToLogos: Dictionary<String, AnyObject>!
    private var _sortBysAvailable: Array<String>!
    
    var image: UIImage?
    var articles: Array<Article>?
    
    var id: String{
        get{
            return _id
        }
        set{
            _id = newValue
        }
    }
    var name: String{
        get{
            return _name
        }
        set{
            _name = newValue
        }
    }
    var description: String{
        get{
            return _description
        }
        set{
            _description = newValue
        }
    }
    var url: String{
        get{
            return _url
        }
        set{
            _url = newValue
        }
    }
    var category: String{
        get{
            return _category
        }
        set{
            _category = newValue
        }
    }
    var urlToLogos: Dictionary<String, AnyObject>{
        get{
            return _urlToLogos
        }
        set{
            _urlToLogos = newValue
        }
    }
    var sortsByAvailable: Array<String>{
        get{
            return _sortBysAvailable
        }
        set{
            _sortBysAvailable = newValue
        }
    }
}
