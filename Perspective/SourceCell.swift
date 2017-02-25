//
//  SourceCell.swift
//  Perspective
//
//  Created by Saketh D on 2/22/17.
//  Copyright © 2017 Saketh D. All rights reserved.
//

import UIKit

class SourceCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var sourceView: UILabel!
    @IBOutlet weak var articleScrollView: UIScrollView!
    
    func configureCell(image: UIImage, title: String, source: Source){
        imageView.image = image
        sourceView.text = title
    }
    
    func configureScrollView(source: Source){
        
    }
    
}
