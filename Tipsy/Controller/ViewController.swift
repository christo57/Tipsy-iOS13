//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    
    @IBOutlet weak var splitLabel: UILabel!
    @IBOutlet weak var splitStepper: UIStepper!
    
    @IBOutlet weak var tip0: UIButton!
    @IBOutlet weak var tip10: UIButton!
    @IBOutlet weak var tip20: UIButton!
    
    @IBOutlet weak var caluculateButton: UIButton!
    
    var billBrain = BillBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        
        let tips = [tip0, tip10, tip20]
        
        for tip in tips {
            tip?.isSelected = false
        }
        
        sender.isSelected = true
        var title = sender.currentTitle!
        title.removeLast()
        
        print(title)
    }
    

    @IBAction func splitValueChanged(_ sender: UIStepper) {
        let newSplit = Int(sender.value)

        splitLabel.text = String(newSplit)
    }

    
    @IBAction func calculatePushed(_ sender: UIButton) {
        var total = billTextField.text ?? "0"
        if total.count == 0 {
            total = "0"
        }
        
        let split = Int(splitStepper.value)
        
        var tipSelected: Int = 0
        let tips = [tip0, tip10, tip20]
        for tip in tips {
            if tip!.isSelected {
                tipSelected = Int(String(tip!.currentTitle!.dropLast()))!
            }
        }
        
        billBrain.doMath(total, tipSelected, split)
        self.performSegue(withIdentifier: "goToCalculate", sender: self)
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToCalculate" {
            let secondVC = segue.destination as! CalculateViewController
            secondVC.totalPerPerson = billBrain.totalPerPerson
            secondVC.numberPeople = billBrain.split
            secondVC.percentageTip = billBrain.tip
        }
    }

}

