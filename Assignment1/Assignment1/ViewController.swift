//
//  ViewController.swift
//  Assignment1
//
//  Created by 刘益宏 on 1/28/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtFirstName: UITextField!
    @IBOutlet weak var txtLastName: UITextField!
    @IBOutlet weak var lblHello: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func sayHellofUNCTION(_ sender: Any) {
        let firstName = txtFirstName.text!
        
        let lastName = txtLastName.text!
        
        if firstName.isEmpty && lastName.isEmpty {
            lblHello.text = "Plz enter fist and last name"
        }
        
        else if !firstName.isEmpty && lastName.isEmpty {
            lblHello.text = "Enter Last Name"
        }
        
        else if !lastName.isEmpty && firstName.isEmpty {
            lblHello.text = "Enter First Name"
        }
        
        else if !firstName.isEmpty && !lastName.isEmpty {
            lblHello.text = "Hello \(firstName) \(lastName)"
        }
    }
    
}

