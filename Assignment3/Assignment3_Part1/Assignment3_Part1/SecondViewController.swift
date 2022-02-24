//
//  SecondViewController.swift
//  Assignment3_Part1
//
//  Created by 刘益宏 on 2/14/22.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var lblWelcome: UILabel!
    
    var welcomeStr = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblWelcome.text = welcomeStr

        // Do any additional setup after loading the view.
    }
    

    @IBAction func goBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    

}
