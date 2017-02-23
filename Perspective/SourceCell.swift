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
    
    func configureCell(image: UIImage){
        imageView.image = image
    }
    
}
