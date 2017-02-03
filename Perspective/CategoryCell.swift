//
//  HeadlineCell.swift
//  Perspective
//
//  Created by Saketh D on 2/2/17.
//  Copyright © 2017 Saketh D. All rights reserved.
//

import UIKit

class CatagoryCell: UITableViewCell {
    
    @IBOutlet weak var genreLabel: UILabel!
    
    func configureCell(title: catagories){
        var text = title.apiValue.capitalized
        text = text.replacingOccurrences(of: "-", with: " ")
        genreLabel.text = text
    }
    
}
