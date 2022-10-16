//
//  ViewController.swift
//  PizzaCalculator
//
//  Created by Anton Boev on 16.10.2022.
//

import UIKit


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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func areaCalculationOne(for: Double) {
    }

    private func priceCalculation(for price: Double) {
    
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        dismiss(animated: true)
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


//MARK: - UITextFieldDelegate
extension SettingsViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let text = textField.text else {
            showAlert(title: "Не правильное значение", message: "Введите числовое значение")
            return
        }
        guard let currentValue = Double(text), (0...4000).contains(currentValue) else {
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
