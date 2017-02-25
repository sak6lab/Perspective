//
//  Article.swift
//  Perspective
//
//  Created by Saketh D on 2/25/17.
//  Copyright © 2017 Saketh D. All rights reserved.
//

class Article{
    private var _author: String!
    private var _title: String!
    private var _description: String!
    private var _url: String!
    private var _urlToImage: String!
    private var _publishedAt: String!
    
    var author: String{
        get{
            return _author
        }
        set{
            _author = newValue
        }
    }
    var title: String{
        get{
            return _title
        }
        set{
            _title = newValue
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
    var urlToImage: String{
        get{
            return _urlToImage
        }
        set{
            _urlToImage = newValue
        }
    }
    var publishedAt: String{
        get{
            return _publishedAt
        }
        set{
            _publishedAt = newValue
        }
    }
    
}
