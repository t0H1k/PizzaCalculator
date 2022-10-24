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
    
    @IBOutlet var pizzaOneTotalWeightLabel: UILabel!
    @IBOutlet var pizzaTwoTotalWeightLabel: UILabel!
    @IBOutlet var pizzaThreeTotalWeightLabel: UILabel!
    
    var pizzaOneSquareText: String!
    var pizzaTwoSquareText: String!
    var pizzaThreeSquareText: String!
    
    var pizzaOneTotalPrice: String!
    var pizzaTwoTotalPrice: String!
    var pizzaThreeTotalPrice: String!
    
    var pizzaOneTotalWeight: String!
    var pizzaTwoTotalWeight: String!
    var pizzaThreeTotalWeight: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addVerticalGradientLayer()
        
        pizzaOneSquareLabel.text = "\(pizzaOneSquareText ?? "") см²"
        pizzaTwoSquareLabel.text = "\(pizzaTwoSquareText ?? "") см²"
        pizzaThreeSquareLabel.text = "\(pizzaThreeSquareText ?? "") см²"
        
        pizzaOnePriceLabel.text = "\(pizzaOneTotalPrice ?? "") ₽"
        pizzaTwoPriceLabel.text = "\(pizzaTwoTotalPrice ?? "") ₽"
        pizzaThreePriceLabel.text = "\(pizzaThreeTotalPrice ?? "") ₽"
        
        pizzaOneTotalWeightLabel.text = "\(pizzaOneTotalWeight ?? "") гр."
        pizzaTwoTotalWeightLabel.text = "\(pizzaTwoTotalWeight ?? "") гр."
        pizzaThreeTotalWeightLabel.text = "\(pizzaThreeTotalWeight ?? "") гр."
    }
    
    @IBAction func backButtonPressed() {
        dismiss(animated: true)
    }
    
}
