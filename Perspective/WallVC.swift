//
//  ViewController.swift
//  Perspective
//
//  Created by Saketh D on 2/2/17.
//  Copyright © 2017 Saketh D. All rights reserved.
//

import UIKit
import FirebaseDatabase

class WallVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var categoriesTable: UITableView!
    @IBOutlet weak var segue: UIStoryboardSegue!
    var frequency: Frequency!
    var cellOrder: Array<Category>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        categoriesTable.dataSource = self
        categoriesTable.delegate = self
        
        frequency = Frequency()
        ref.observe(FIRDataEventType.value, with: {(snapshot) in
            self.cellOrder = Array<Category>()
            if let freqDict = snapshot.value as? [String: AnyObject]{
                if let businessFreq = freqDict["business"] as? NSNumber as? Int{
                    let category = Category(cat: .Business, frequency: businessFreq)
                    self.cellOrder.append(category)
                }
                if let entertainmentFreq = freqDict["entertainment"] as? NSNumber as? Int{
                    let category = Category(cat: .Entertainment, frequency: entertainmentFreq)
                    self.cellOrder.append(category)
                }
                if let gamingFreq = freqDict["gaming"] as? NSNumber as? Int{
                    let category = Category(cat: .Gaming, frequency: gamingFreq)
                    self.cellOrder.append(category)

                }
                if let generalFreq = freqDict["general"] as? NSNumber as? Int {
                    let category = Category(cat: .General, frequency: generalFreq)
                    self.cellOrder.append(category)

                }
                if let musicFreq = freqDict["music"] as? NSNumber as? Int {
                    let category = Category(cat: .Music, frequency: musicFreq)
                    self.cellOrder.append(category)

                }
                if let scienceAndNatureFreq = freqDict["science-and-nature"] as? NSNumber as? Int{
                    let category = Category(cat: .ScienceAndNature, frequency:  scienceAndNatureFreq)
                    self.cellOrder.append(category)

                }
                if let sportFreq = freqDict["sport"] as? NSNumber as? Int{
                    let category = Category(cat: .Sport, frequency: sportFreq)
                    self.cellOrder.append(category)

                }
                if let technologyFreq = freqDict["technology"] as? NSNumber as? Int{
                    let category = Category(cat: .Technology, frequency: technologyFreq)
                    self.cellOrder.append(category)

                }
                
                self.cellOrder.sort {
                    $0.frequency > $1.frequency
                }
                
                for category in self.cellOrder{
                    print(category.frequency)
                }
                
                self.categoriesTable.reloadData()
            }
        })
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if cellOrder != nil{
            return cellOrder.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = categoriesTable.dequeueReusableCell(withIdentifier: "CategoryCell") as? CategoryCell{
            let cat = cellOrder[indexPath.row]
            cell.configureCell(category: cat)
            return cell
        } else {
            return CategoryCell()
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return categoriesTable.frame.height/8
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let category = cellOrder[indexPath.row]
        let articlesVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ID") as! ArticlesVC
        articlesVC.category = category
        categoriesTable.deselectRow(at: indexPath, animated: true)
        ref.child(category.cat.apiValue).setValue(category.frequency+1)
        self.navigationController?.pushViewController(articlesVC, animated: true)
    }
}

