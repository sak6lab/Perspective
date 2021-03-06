//
//  HeadlineCell.swift
//  Perspective
//
//  Created by Saketh D on 2/2/17.
//  Copyright © 2017 Saketh D. All rights reserved.
//

import UIKit
import FirebaseDatabase

class CategoryCell: UITableViewCell {
    
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var iconView: UIImageView!
    
    override func awakeFromNib() {
        self.layer.cornerRadius = 2.0
        self.clipsToBounds = true
        self.layer.borderWidth = 2.0
        self.layer.borderColor = AQUACG
    }
    func configureCell(category: Category){
        for subUIView in self.subviews as [UIView] {
            if subUIView.tag == 1{
                subUIView.removeFromSuperview()
            }
        }
        
        let cat = category.cat
        
        var text = cat.apiValue.capitalized
        text = text.replacingOccurrences(of: "-", with: " ")
        genreLabel.text = text
        
        iconView.image = cat.imageValue
    }
    
}
