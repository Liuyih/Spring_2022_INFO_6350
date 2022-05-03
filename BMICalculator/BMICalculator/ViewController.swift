//
//  ViewController.swift
//  BMICalculator
//
//  Created by 刘益宏 on 5/2/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtWeight: UITextField!
    
    
    @IBOutlet weak var txtFeet: UITextField!
    
    
    @IBOutlet weak var txtInch: UITextField!
    
    
    @IBOutlet weak var lblBMI: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    var weightInKg : Float = 0.0
    var heightInFeet : Float = 0.0
    var heightInInch : Float = 0.0
    var heightInM : Float = 0.0
    var BMI : Float = 0.0
    //let weightInKg: Float = txtWeight.text * 0.45359237


    @IBAction func calculateBMIAction(_ sender: Any) {
        weightInKg = (txtWeight.text! as NSString).floatValue * 0.45359237
        print(weightInKg)
        heightInFeet = (txtFeet.text! as NSString).floatValue * 0.3048
        print(heightInFeet)
        heightInInch = (txtInch.text! as NSString).floatValue * 0.0254
        print(heightInInch)
        heightInM = heightInFeet + heightInInch
        print(heightInM)
        BMI = weightInKg / (heightInM * heightInM)
        print(String(format: "%.2f", BMI))
        
        if (BMI < 18.5) {
            lblBMI.text = "your BMI is : \(String(format: "%.2f", BMI)) and you are underweight"
        }
        else if (BMI < 24.9) {
            lblBMI.text = "your BMI is : \(String(format: "%.2f", BMI)) and you are healthy"
        }
        else if (BMI < 29.9) {
            lblBMI.text = "your BMI is : \(String(format: "%.2f", BMI)) and you are overweight"
        }
        else {
            lblBMI.text = "your BMI is : \(String(format: "%.2f", BMI)) and you are obese"
        }
        
    }
}

