//
//  ViewController.swift
//  PizzaCalculator
//
//  Created by Anton Boev on 16.10.2022.
//

import UIKit
import Foundation

class SettingsViewController: UIViewController {

    @IBOutlet var pizzaOneDiameterTF: UITextField!
    @IBOutlet var pizzaTwoDiameterTF: UITextField!
    @IBOutlet var pizzaThreeDiameterTF: UITextField!
    
    @IBOutlet var pizzaOnePriceTF: UITextField!
    @IBOutlet var pizzaTwoPriceTF: UITextField!
    @IBOutlet var pizzaThreePriceTF: UITextField!

    @IBOutlet var pizzaOneCountTF: UITextField!
    @IBOutlet var pizzaTwoCountTF: UITextField!
    @IBOutlet var pizzaThreeCountTF: UITextField!

    @IBOutlet var pizzaOneWeightTF: UITextField!
    @IBOutlet var pizzaTwoWeightTF: UITextField!
    @IBOutlet var pizzaThreeWeightTF: UITextField!
    
//    private var pizzaOneSquare: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addVerticalGradientLayer()
    }
    
    @IBAction func calculateButtonPressed() {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let resultVC = segue.destination as? ResultViewController else { return }
        
        resultVC.pizzaOneSquareText = areaCalculation(for: pizzaOneDiameterTF.text ?? "", and: pizzaOneCountTF.text ?? "")
        resultVC.pizzaTwoSquareText = areaCalculation(for: pizzaTwoDiameterTF.text ?? "", and: pizzaTwoCountTF.text ?? "")
        resultVC.pizzaThreeSquareText = areaCalculation(for: pizzaThreeDiameterTF.text ?? "", and: pizzaThreeCountTF.text ?? "")
        
        resultVC.pizzaOneTotalPrice = priceCalculation(for: pizzaOnePriceTF.text ?? "", and: pizzaOneCountTF.text ?? "")
        resultVC.pizzaTwoTotalPrice = priceCalculation(for: pizzaTwoPriceTF.text ?? "", and: pizzaTwoCountTF.text ?? "")
        resultVC.pizzaThreeTotalPrice = priceCalculation(for: pizzaThreePriceTF.text ?? "", and: pizzaThreeCountTF.text ?? "")
        
        resultVC.pizzaOneTotalWeight = weightCalculation(for: pizzaOneWeightTF.text ?? "", and: pizzaOneCountTF.text ?? "")
        resultVC.pizzaTwoTotalWeight = weightCalculation(for: pizzaTwoWeightTF.text ?? "", and: pizzaTwoCountTF.text ?? "")
        resultVC.pizzaThreeTotalWeight = weightCalculation(for: pizzaThreeWeightTF.text ?? "", and: pizzaThreeCountTF.text ?? "")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
}

// MARK: - Private Methods

extension SettingsViewController {
    private func areaCalculation(for pizza: String, and count: String) -> String {
        let pizza = Double((pizza as NSString).doubleValue)
        let count = Double((count as NSString).doubleValue)
        let pizzaOneSquare: Double

        pizzaOneSquare = Double.pi * (pizza * 2) * count
        return String(format: "%.2f", pizzaOneSquare)
    }

    private func priceCalculation(for price: String, and count: String) -> String {
        let price = Double((price as NSString).doubleValue)
        let count = Double((count as NSString).doubleValue)
        let pizzaOneTotalPrice: Double
        
        if count == 1 {
            pizzaOneTotalPrice = price * count
        } else {
            pizzaOneTotalPrice = price * 1
        }
//        pizzaOneTotalPrice = price * count
        return String(format: "%.2f", pizzaOneTotalPrice)
    }
    
    private func weightCalculation(for weight: String, and count: String) -> String {
        let weight = Double((weight as NSString).doubleValue)
        let count = Double((count as NSString).doubleValue)
        let totalWeight: Double
        
        totalWeight = weight * count
        return String(format: "%.2f", totalWeight)
    }
    
    private func showAlert(title: String, message: String, textField: UITextField? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            textField?.text = "0"
            textField?.becomeFirstResponder()
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}


// MARK: - UITextFieldDelegate
extension SettingsViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let text = textField.text else {
            showAlert(title: "Не правильное значение", message: "Введите числовое значение")
            return
        }
        guard let currentValue = Float(text), (0...4000).contains(currentValue) else {
            showAlert(title: "Не правильное значение", message: "Введите настоящее значение", textField: textField)
            return
        }
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        let keyboardToolBar = UIToolbar()
        keyboardToolBar.sizeToFit()
        textField.inputAccessoryView = keyboardToolBar
        
        let doneButton = UIBarButtonItem(
            barButtonSystemItem: .done,
            target: textField,
            action: #selector(resignFirstResponder)
        )
        
        let flexBarButton = UIBarButtonItem(
            barButtonSystemItem: .flexibleSpace,
            target: nil,
            action: nil
        )
        
        keyboardToolBar.items = [flexBarButton, doneButton]
    }
}

extension CGFloat {
    static func randomColor() -> CGFloat {
        CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}

extension UIColor {
    static func random() -> UIColor {
        return UIColor(
            red: .randomColor(),
            green: .randomColor(),
            blue: .randomColor(),
            alpha: 1
        )
    }
}

extension UIView {
    func addVerticalGradientLayer() {
        let firstColor = UIColor.random()
        let secondColor = UIColor.random()
        
        let gradient = CAGradientLayer()
        gradient.frame = bounds
        gradient.colors = [firstColor.cgColor, secondColor.cgColor]
        gradient.locations = [0.0, 1.0]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 0, y: 1)
        layer.insertSublayer(gradient, at: 0)
    }
}
