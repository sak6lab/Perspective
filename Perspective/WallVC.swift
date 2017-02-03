//
//  ViewController.swift
//  Perspective
//
//  Created by Saketh D on 2/2/17.
//  Copyright © 2017 Saketh D. All rights reserved.
//

import UIKit

class WallVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var categoriesTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        categoriesTable.dataSource = self
        categoriesTable.delegate = self
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = categoriesTable.dequeueReusableCell(withIdentifier: "CategoryCell") as? CatagoryCell{
            if let genre = catagories(rawValue: indexPath.row){
                cell.configureCell(title: genre)
                if indexPath.row%2 == 0{
                    cell.contentView.backgroundColor = UIColor(red: 233/255, green: 176/255, blue: 0/255, alpha: 1)
                } else {
                    cell.contentView.backgroundColor = UIColor(red: 226/255, green: 78/225, blue: 66/255, alpha: 1)
                }
            }
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let height = categoriesTable.frame.height/CGFloat(8)
        return height
    }
}

