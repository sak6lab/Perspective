//
//  ArticlesVC.swift
//  Perspective
//
//  Created by Saketh D on 2/14/17.
//  Copyright © 2017 Saketh D. All rights reserved.
//

import UIKit
import Alamofire

class ArticlesVC: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    let SOURCECELLID = "SourceCell"
    let ARTICLECELLID = "ArticleCell"
    
    @IBOutlet weak var sourceTableView: UITableView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    var category: categories!
    var articleSources = Array<Source>()
    
    var storedOffsets = Dictionary<Int,CGFloat>()
    
    override func viewDidLoad() {
        sourceTableView.delegate = self
        sourceTableView.dataSource = self
        getSourcesForCategory()
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articleSources.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = sourceTableView.dequeueReusableCell(withIdentifier: SOURCECELLID) as? SourceCell{
            let source = articleSources[indexPath.row]
            if source.image == nil {
                Alamofire.request(source.urlToLogos["large"]!).responseData { response in
                    let data = response.data
                    if data != nil{
                        let image = UIImage(data: data!)
                        source.image = image
                        cell.configureCell(image: source.image!, title: source.name)
                        cell.setCollectionViewDelegateAndDataSource(dataSource: self, delegate: self, index: indexPath.row)
                    }
                }
            }else{
                cell.configureCell(image: source.image!, title: source.name)
                cell.setCollectionViewDelegateAndDataSource(dataSource: self, delegate: self, index: indexPath.row)
            }
            return cell
        }
        return SourceCell()
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if let sourceCell = cell as? SourceCell{
            
            sourceCell.collectionViewOffset = storedOffsets[indexPath.row] ?? 0
        }
    }
    func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if let sourceCell = cell as? SourceCell{
            storedOffsets[indexPath.row] = sourceCell.collectionViewOffset
        }
    }
    
    
    func getArticleForSource(source: Source, sortBy: String){
        var articlesArray = Array<Article>()
        let strURL = "\(baseURL)\(articleURL)\(sourceParamURL)\(source.id)&\(sortByParamURL)\(segmentedControl.titleForSegment(at: segmentedControl.selectedSegmentIndex)!.lowercased())&\(apiKeyParamURL)"
        Alamofire.request(strURL).responseJSON{ response in
            let value = response.result.value
            if let mainDict = value as? Dictionary<String,AnyObject>{
                if let articleArr  = mainDict["articles"] as? Array<Dictionary<String,AnyObject>>{
                    for dict in articleArr{
                        let article = Article()
                        if let author = dict["author"] as? String{
                            article.author = author
                        }
                        if let title = dict["title"] as? String{
                            article.title = title
                        }
                        if let description = dict["description"] as? String{
                            article.description = description
                        }
                        if let url = dict["url"] as? String{
                            article.url = url
                        }
                        if let urlToImage = dict["urlToImage"] as? String{
                            article.urlToImage = urlToImage
                            Alamofire.request(urlToImage).responseData(completionHandler: { response in
                                let data = response.data
                                if data != nil{
                                    article.image = UIImage(data: data!)
                                }
                            })
                        }
                        if let publishedAt = dict["publishedAt"] as? String{
                            article.publishedAt = publishedAt
                        }
                        articlesArray.append(article)
                    }
                }
                if sortBy == "top"{
                    source.topArticles = articlesArray
                    source.mode = true
                } else {
                    source.latestArticles = articlesArray
                    source.mode = false
                }
            }
            self.sourceTableView.reloadData()
        }
    }
    
    func getSourcesForCategory(){
        let strURL = "\(baseURL)\(sourceURL)\(categoryParamURL)\(category.apiValue)&\(languageParamURL)"
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
                        if let urlsToLogos = dict["urlsToLogos"] as? Dictionary<String, String>{
                            source.urlToLogos = urlsToLogos
                        }
                        if let sortBysAvailable = dict["sortBysAvailable"] as? Array<String>{
                            source.sortsByAvailable = sortBysAvailable
                        }
                        self.getArticleForSource(source: source, sortBy: self.segmentedControl.titleForSegment(at: self.segmentedControl.selectedSegmentIndex)!.lowercased())
                        sources.append(source)
                    }
                    self.articleSources = sources
                    self.sourceTableView.reloadData()
                }
            }
        }
    }
    
    @IBAction func segmentChanged(sender: UISegmentedControl){
        for source in articleSources{
            for str in source.sortsByAvailable{
                if str == sender.titleForSegment(at: sender.selectedSegmentIndex)!.lowercased(){
                    if str == "top"{
                        source.mode = true
                        if source.topArticles == nil {
                            getArticleForSource(source: source, sortBy: str)
                        }
                    } else {
                        source.mode = false
                        if source.latestArticles == nil {
                            getArticleForSource(source: source, sortBy: str)
                        }
                    }
                    sourceTableView.reloadData()
                }
            }
        }
    }
}
