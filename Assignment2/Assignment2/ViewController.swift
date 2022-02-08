//
//  ViewController.swift
//  Assignment2
//
//  Created by 刘益宏 on 2/7/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    let images = ["burger", "dumplings", "hotPot", "iceCream", "koreanColdNoodle", "orangeChicken", "padThai", "pizza", "ramen", "salad"]
    
    let foodNames = ["Burger", "Dumplings", "Hot Pot", "Ice cream", "Korean Cold Noodle", "Orange Chicken", "Pad Thai", "Pizza", "Ramen", "Salad"]
    @IBOutlet weak var tblView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tblView.delegate = self
        tblView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return images.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        
        cell.imgViewCell.image = UIImage(named: images[indexPath.row])
        cell.lblCell.text = foodNames[indexPath.row]
        
        return cell
    }


}

