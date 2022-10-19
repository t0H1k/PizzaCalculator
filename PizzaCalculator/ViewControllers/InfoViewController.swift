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
        infoLabel.text = """
    Заказывая пиццу мы зачастую выбираем те что представлены в разделе Акции.
    Но не всегда выгодно купить несколько вместо одной большой.
    Этот калькулятор поможет сделать выбор!
    """
    }
    
    @IBAction func backButtonDidTapped() {
        dismiss(animated: true)
    }
    
}
