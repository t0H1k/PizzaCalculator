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
    
    var pizzaOneSquareText: String!
    var pizzaTwoSquareText: String!
    var pizzaThreeSquareText: String!
    
    var pizzaOneTotalPrice: String!
    var pizzaTwoTotalPrice: String!
    var pizzaThreeTotalPrice: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pizzaOneSquareLabel.text = pizzaOneSquareText
        pizzaTwoSquareLabel.text = pizzaTwoSquareText
        pizzaThreeSquareLabel.text = pizzaThreeSquareText
        
        pizzaOnePriceLabel.text = pizzaOneTotalPrice
        pizzaTwoPriceLabel.text = pizzaTwoTotalPrice
        pizzaThreePriceLabel.text = pizzaThreeTotalPrice
    }
    
    @IBAction func backButtonPressed() {
        dismiss(animated: true)
    }
    
}
