//
//  InfoViewController.swift
//  PizzaCalculator
//
//  Created by Anton Boev on 16.10.2022.
//

import UIKit

class InfoViewController: UIViewController {

    @IBOutlet var infoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func backButtonDidTapped() {
        dismiss(animated: true)
    }
    
}
