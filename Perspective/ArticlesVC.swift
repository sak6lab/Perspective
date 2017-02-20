//
//  ArticlesVC.swift
//  Perspective
//
//  Created by Saketh D on 2/14/17.
//  Copyright © 2017 Saketh D. All rights reserved.
//

import UIKit
import Alamofire

class ArticlesVC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate{
    
    @IBOutlet weak var articleCollection: UICollectionView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    var category: categories!
    var articleSources: Array<Source>!
    
    override func viewDidLoad() {
        articleCollection.delegate = self
        articleCollection.dataSource = self
        getSourcesForCategory()
        
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
    
    func getSourcesForCategory(){
        let strURL = "\(baseURL)\(sourceURL)\(categoryURL)\(category.apiValue)&\(language)"
        print(strURL)
        let url = URL(string: strURL)
        Alamofire.request(url!).responseJSON { response in
            let value = response.result.value
            if let arr = value as? Array<Dictionary<String, AnyObject>>{
                var sources = Array<Source>()
                for dict in arr{
                    let source = Source()
                    if let id = dict["id"] as? String{
                        source.id = id
                    }
                    if let name = dict["name"] as? String{
                        source.name = name
                    }
                    if let desc = dict["description"] as? String{
                        source.description = desc
                    }
                    if let url = dict["url"] as? String{
                        source.url = url
                    }
                    if let category = dict["category"] as? String{
                        source.category = category
                    }
                    if let urlsToLogos = dict["urlsToLogos"] as? Dictionary<String, String>{
                        source.urlToLogos = urlsToLogos
                    }
                    if let sortBysAvailable = dict["sortBysAvailable"] as? Array<String>{
                        source.sortsByAvailable = sortBysAvailable
                    }
                    sources.append(source)
                }
                self.articleSources = sources
            }
        }
    }

}
