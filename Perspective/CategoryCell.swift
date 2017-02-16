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
    @IBOutlet weak var percentLabel: UILabel!
    
    func configureCell(title: categories, ratio: Double){
        for subUIView in self.subviews as [UIView] {
            if subUIView.tag == 1{
                subUIView.removeFromSuperview()
            }
        }
        
        let width = self.frame.width/8
        let height = self.frame.height*CGFloat(ratio)
        let rect = CGRect(x: 0, y: 0, width: width, height: height)
        let view = UIView(frame: rect)
        view.tag = 1
        view.backgroundColor = BLUSH
        self.addSubview(view)
        self.sendSubview(toBack: view)
        self.backgroundColor = MUSTARD
        
        let percent = ratio*100
        let percentTrunc = Double(round(100*percent)/100)
        percentLabel.text = "\(percentTrunc)%"
        percentLabel.textColor = PAPAYA
        let constraint = NSLayoutConstraint(item: percentLabel, attribute: NSLayoutAttribute.width, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1, constant: width)
        NSLayoutConstraint.activate([constraint])
        
        
        var text = title.apiValue.capitalized
        text = text.replacingOccurrences(of: "-", with: " ")
        genreLabel.text = text
    }
    
}
