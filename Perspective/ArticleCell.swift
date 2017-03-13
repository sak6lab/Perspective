//
//  ArticleCell.swift
//  Perspective
//
//  Created by Saketh D on 3/7/17.
//  Copyright © 2017 Saketh D. All rights reserved.
//

import UIKit

class ArticleCell: UICollectionViewCell {
    
    @IBOutlet weak var articleImage: UIImageView!
    @IBOutlet weak var articleTitle: UILabel!
    
    func configureCell(image: UIImage, title: String){
        articleImage.image = image
        articleImage.clipsToBounds = true
        articleTitle.text = title
    }
    
}
