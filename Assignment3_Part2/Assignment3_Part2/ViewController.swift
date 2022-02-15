//
//  ViewController.swift
//  Assignment3_Part2
//
//  Created by 刘益宏 on 2/14/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var tblView: UITableView!
    
    let images = ["burger", "dumplings", "hotPot", "iceCream", "koreanColdNoodle", "orangeChicken", "padThai", "pizza", "ramen", "salad"]
    
    let imageLabel = ["Burger", "Dumplings", "HotPot", "IceCream", "KoreanColdNoodle", "OrangeChicken", "PadThai", "Pizza", "Ramen", "Salad"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return images.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("TableViewCell", owner: self, options: nil)?.first as! TableViewCell
        cell.imgView.image = UIImage(named: images[indexPath.row])
        cell.lblImage.text = imageLabel[indexPath.row]
        return cell
    }


}

