//
//  SourceCell.swift
//  Perspective
//
//  Created by Saketh D on 2/22/17.
//  Copyright © 2017 Saketh D. All rights reserved.
//

import UIKit
import Alamofire

class SourceCell: UITableViewCell {
    
    var collectionViewOffset: CGFloat{
        get{
            return articleCollectionView.contentOffset.x
        }
        set{
            articleCollectionView.contentOffset.x = newValue
        }
    }
    
    @IBOutlet weak var sourceImageView: UIImageView!
    @IBOutlet weak var sourceNameView: UILabel!
    @IBOutlet weak var articleCollectionView: UICollectionView!
    
    func configureCell(image: UIImage, title: String){
        sourceImageView.image = image
        sourceNameView.text = title
    }
    
    func setCollectionViewDelegateAndDataSource(dataSource: UICollectionViewDataSource, delegate: UICollectionViewDelegate, index: Int){
        articleCollectionView.dataSource = dataSource
        articleCollectionView.delegate = delegate
        articleCollectionView.tag = index
        articleCollectionView.reloadData()
    }
}

extension ArticlesVC: UICollectionViewDataSource, UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let source = articleSources[collectionView.tag]
        if source.mode != nil{
            if source.mode! {
                if source.topArticles != nil{
                    return source.topArticles!.count
                }
            } else {
                if source.latestArticles != nil{
                    return source.latestArticles!.count
                }
            }
        }
        
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ARTICLECELLID, for: indexPath) as? ArticleCell{
            let source = articleSources[collectionView.tag]
            
            var article: Article!
            if source.mode!{
                article = source.topArticles![indexPath.row]
            } else {
                article = source.latestArticles![indexPath.row]
            }
            
            if article.image != nil{
                cell.configureCell(image: article.image!, title: article.title)
            } else {
                cell.configureCell(image: #imageLiteral(resourceName: "default"), title: article.title)
            }
            
            return cell
        }
        return ArticleCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let source = articleSources[collectionView.tag]
        
        var article: Article!
        if source.mode!{
            article = source.topArticles![indexPath.row]
        } else {
            article = source.latestArticles![indexPath.row]
        }
        
        let articleViewerVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AVVC") as! ArticleViewerVC
        articleViewerVC.article = article
        self.navigationController?.pushViewController(articleViewerVC, animated: true)
    }
}
