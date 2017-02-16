//
//  ArticleCell.swift
//  Perspective
//
//  Created by Saketh D on 2/15/17.
//  Copyright © 2017 Saketh D. All rights reserved.
//

import UIKit

class ArticleCell: UICollectionViewCell {
    @IBOutlet weak var articleImage: UIImageView!
    @IBOutlet weak var articleLabel: UILabel!
    
    func configureCell(image: UIImage, title: String){
        articleImage.image = image
        articleLabel.text = title
    }
    
}
