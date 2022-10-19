//
//  ViewController.swift
//  PizzaCalculator
//
//  Created by Anton Boev on 16.10.2022.
//

import UIKit
import Foundation

class SettingsViewController: UIViewController {

    @IBOutlet var pizzaOneDiameterTextField: UITextField!
    @IBOutlet var pizzaTwoDiameterTextField: UITextField!
    @IBOutlet var pizzaThreeDiameterTextField: UITextField!
    
    @IBOutlet var pizzaOnePriceTextField: UITextField!
    @IBOutlet var pizzaTwoPriceTextField: UITextField!
    @IBOutlet var pizzaThreePriceTextField: UITextField!

    @IBOutlet var pizzaOnePieceTextField: UITextField!
    @IBOutlet var pizzaTwoPieceTextField: UITextField!
    @IBOutlet var pizzaThreePieceTextField: UITextField!

    private var pizzaOneSquare: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func calculateButtonPressed() {

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let resultVC = segue.destination as? ResultViewController else { return }
        resultVC.pizzaOneSquareText = areaCalculation(for: pizzaOneDiameterTextField.text ?? "", and: pizzaOnePieceTextField.text ?? "")
        resultVC.pizzaTwoSquareText = areaCalculation(for: pizzaTwoDiameterTextField.text ?? "", and: pizzaTwoPieceTextField.text ?? "")
        resultVC.pizzaThreeSquareText = areaCalculation(for: pizzaThreeDiameterTextField.text ?? "", and: pizzaThreePieceTextField.text ?? "")
        resultVC.pizzaOneTotalPrice = priceCalculation(for: pizzaOnePriceTextField.text ?? "", and: pizzaOnePieceTextField.text ?? "")
        resultVC.pizzaTwoTotalPrice = priceCalculation(for: pizzaTwoPriceTextField.text ?? "", and: pizzaTwoPieceTextField.text ?? "")
        resultVC.pizzaThreeTotalPrice = priceCalculation(for: pizzaThreePriceTextField.text ?? "", and: pizzaThreePieceTextField.text ?? "")
        
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

        pizzaOneSquare = Double.pi * pizza * 2.0 * count
        return String(format: "%.2f", pizzaOneSquare)
    }

    private func priceCalculation(for price: String, and count: String  ) -> String {
        let price = Double((price as NSString).doubleValue)
        let count = Double((count as NSString).doubleValue)
        let pizzaOneTotalPrice: Double

        pizzaOneTotalPrice = price * count
        return String(format: "%.2f", pizzaOneTotalPrice)
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
