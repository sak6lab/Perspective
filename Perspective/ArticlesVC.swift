//
//  ArticlesVC.swift
//  Perspective
//
//  Created by Saketh D on 2/14/17.
//  Copyright © 2017 Saketh D. All rights reserved.
//

import UIKit

class ArticlesVC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate{
    
    @IBOutlet weak var articleCollection: UICollectionView!
    var category: categories!
    
    override func viewDidLoad() {
        articleCollection.delegate = self
        articleCollection.dataSource = self
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = articleCollection.dequeueReusableCell(withReuseIdentifier: "Article", for: indexPath) as? ArticleCell{
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    

}
