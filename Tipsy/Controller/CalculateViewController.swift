//
//  CalculateViewController.swift
//  Tipsy
//
//  Created by Christopher Klein on 13/06/2020.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {
    
    var totalPerPerson: Float?
    var numberPeople: Int?
    var percentageTip: Int?

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var textLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        totalLabel.text = String(format: "%.2f", totalPerPerson!)
        textLabel.text = "Split between \(numberPeople!) people, with \(percentageTip!)% tip."
    }
    



    @IBAction func recalculatePushed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
