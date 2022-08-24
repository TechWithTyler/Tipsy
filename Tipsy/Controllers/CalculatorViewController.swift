//
//  CalculatorViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

	@IBOutlet weak var billTextField: UITextField?

	@IBOutlet weak var zeroPctButton: UIButton?

	@IBOutlet weak var tenPctButton: UIButton?

	@IBOutlet weak var twentyPctButton: UIButton?

	@IBOutlet weak var splitNumberLabel: UILabel?

	var tip = 0.10

	var numberOfPeople = 2

	var billTotal = 0.0
	
	@IBAction func tipChanged(_ sender: UIButton) {
		billTextField?.endEditing(true)
		zeroPctButton?.isSelected = false
		tenPctButton?.isSelected = false
		twentyPctButton?.isSelected = false
		sender.isSelected = true
		let buttonTitle = sender.currentTitle!
		let buttonTitleMinusPercentSign = String(buttonTitle.dropLast())
		let buttonTitleAsNumber = Double(buttonTitleMinusPercentSign)!
		tip = buttonTitleAsNumber / 100
	}

	@IBAction func stepperValueChanged(_ sender: UIStepper) {
		billTextField?.endEditing(true)
		numberOfPeople = Int(sender.value)
		splitNumberLabel?.text = String(numberOfPeople)
	}


	@IBAction func calculateButtonPressed(_ sender: UIButton) {
		let bill = (billTextField?.text)!
		if bill != "" {
			billTotal = Double(bill)!
			performSegue(withIdentifier: "showResults", sender: self)
		}
	}

	// MARK: - Navigation

	// In a storyboard-based application, you will often want to do a little preparation before navigation
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		// Get the new view controller using segue.destination.
		// Pass the selected object to the new view controller.
		if segue.identifier == "showResults" {
			if let destinationVC = segue.destination as? ResultsViewController {
				destinationVC.billTotal = billTotal
				destinationVC.tip = tip
				destinationVC.numberOfPeople = numberOfPeople
			}
		}
	}

}

