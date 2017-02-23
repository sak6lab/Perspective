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
    
    func configureCell(image: UIImage, title: String){
        imageView.image = image
        sourceView.text = title
    }
    
}
