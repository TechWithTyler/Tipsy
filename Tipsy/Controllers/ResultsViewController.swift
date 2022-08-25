//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Tyler Sheft on 8/23/22.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

	@IBOutlet weak var totalLabel: UILabel?

	@IBOutlet weak var settingsLabel: UILabel?

	var tip = 0.10

	var numberOfPeople = 2

	var billTotal = 0.0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
		let result = billTotal * (1 + tip) / Double(numberOfPeople)
		let resultTo2DecimalPlaces = String(format: "%.2f", result)
		let tipPercentageAsWhole = tip * 100
		totalLabel?.text = resultTo2DecimalPlaces
		settingsLabel?.text = "Split between \(numberOfPeople) people, with \(tipPercentageAsWhole)% tip."
    }
    
	@IBAction func recalculateButtonPressed(_ sender: UIButton) {
		dismiss(animated: true)
	}

}
