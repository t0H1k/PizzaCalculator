//
//  ResultViewController.swift
//  PizzaCalculator
//
//  Created by Anton Boev on 16.10.2022.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet var pizzaOneSquareLabel: UILabel!
    @IBOutlet var pizzaTwoSquareLabel: UILabel!
    @IBOutlet var pizzaThreeSquareLabel: UILabel!
    
    @IBOutlet var pizzaOnePriceLabel: UILabel!
    @IBOutlet var pizzaTwoPriceLabel: UILabel!
    @IBOutlet var pizzaThreePriceLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func backButtonPressed() {
        dismiss(animated: true)
    }
    
    
}
