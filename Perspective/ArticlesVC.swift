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
    
    let SOURCECELLID = "SourceCell"
    
    @IBOutlet weak var articleCollection: UICollectionView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    var category: categories!
    var articleSources = Array<Source>()
    
    override func viewDidLoad() {
        articleCollection.delegate = self
        articleCollection.dataSource = self
        getSourcesForCategory()
        
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if articleSources.count>0{
            return articleSources.count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = articleCollection.dequeueReusableCell(withReuseIdentifier: SOURCECELLID, for: indexPath) as? SourceCell{
            let source = articleSources[indexPath.row]
            if source.image != nil{
                cell.configureCell(image: source.image!)
            } else {
                if let url = source.urlToLogos["large"] as? String{
                    Alamofire.request(url).responseData(completionHandler: { response in
                        if let data = response.result.value{
                            let image = UIImage(data: data)
                            if image != nil{
                                source.image = image
                                cell.configureCell(image: image!)
                            }
                        }
                        
                    })
                }
                
            }
            return cell
        }
        return UICollectionViewCell()
    }
    
    func getSourcesForCategory(){
        let strURL = "\(baseURL)\(sourceURL)\(categoryURL)\(category.apiValue)&\(language)"
        print(strURL)
        let url = URL(string: strURL)
        Alamofire.request(url!).responseJSON { response in
            let value = response.result.value
            if let mainDict = value as? Dictionary<String, AnyObject>{
                if let arr = mainDict["sources"] as? Array<Dictionary<String, AnyObject>>{
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
                        if let urlsToLogos = dict["urlsToLogos"] as? Dictionary<String, AnyObject>{
                            source.urlToLogos = urlsToLogos
                        }
                        if let sortBysAvailable = dict["sortBysAvailable"] as? Array<String>{
                            source.sortsByAvailable = sortBysAvailable
                        }
                        sources.append(source)
                    }
                    self.articleSources = sources
                    self.articleCollection.reloadData()
                }

            }
        }
    }

}
