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
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        categoriesTable.dataSource = self
        categoriesTable.delegate = self
        
        frequency = Frequency()
        ref.observe(FIRDataEventType.value, with: {(snapshot) in
            if let freqDict = snapshot.value as? [String: AnyObject]{
                if let businessFreq = freqDict["business"] as? NSNumber as? Int{
                    self.frequency.businessFreq = businessFreq
                }
                if let entertainmentFreq = freqDict["entertainment"] as? NSNumber as? Int{
                    self.frequency.entertainmentFreq = entertainmentFreq
                }
                if let gamingFreq = freqDict["gaming"] as? NSNumber as? Int{
                    self.frequency.gamingFreq = gamingFreq
                }
                if let generalFreq = freqDict["general"] as? NSNumber as? Int {
                    self.frequency.generalFreq = generalFreq
                }
                if let musicFreq = freqDict["music"] as? NSNumber as? Int {
                    self.frequency.musicFreq = musicFreq
                }
                if let scienceAndNatureFreq = freqDict["scienceandnature"] as? NSNumber as? Int{
                    self.frequency.scienceAndNatureFreq = scienceAndNatureFreq
                }
                if let sportFreq = freqDict["sport"] as? NSNumber as? Int{
                    self.frequency.sportFreq = sportFreq
                }
                if let technologyFreq = freqDict["technology"] as? NSNumber as? Int{
                    self.frequency.technologyFreq = technologyFreq
                }
                self.categoriesTable.reloadData()
            }
        })
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = categoriesTable.dequeueReusableCell(withIdentifier: "CategoryCell") as? CategoryCell{
            let cat = categories(rawValue: indexPath.row)!
            cell.configureCell(title: cat, ratio: frequency.ratio(cat: cat))
            return cell
        } else {
            return UITableViewCell()
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return categoriesTable.frame.height/8
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let category = categories(rawValue: indexPath.row)
        let articlesVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ID") as! ArticlesVC
        articlesVC.category = category
        categoriesTable.deselectRow(at: indexPath, animated: true)
        self.navigationController?.pushViewController(articlesVC, animated: true)
    }
    
    
    
}

