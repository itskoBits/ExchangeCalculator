//
//  ViewController.swift
//  ExchangeCalculator
//
//  Created by Ivelin Davidov on 16.01.19.
//  Copyright © 2019 Ivelin Davidov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var usdTextField: UITextField!
    @IBOutlet var btcTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        usdTextField.addTarget(self, action: #selector(usdTextFieldDidChange), for: .editingChanged)
    }
    
    @objc func usdTextFieldDidChange() {
        let usdText = usdTextField.getText()
        if let usdAmount = Decimal(string: usdText) {
            let calculator = ExchangeCalculator()
            let btcAmount = calculator.getBtcAmount(usdAmount: usdAmount)
            
            let btcAmountFormatter = NumberFormatter()
            btcAmountFormatter.maximumFractionDigits = 8
            btcAmountFormatter.minimumIntegerDigits = 1
            
            let btcText = btcAmountFormatter.string(from: btcAmount as NSNumber)
            btcTextField.text = btcText
        }
    }
    
    @IBAction func didTapExchangeButton(_ sender: Any) {
        let alert = UIAlertController(title: "Congrats!", message: "You successfully bought \(btcTextField.getText())", preferredStyle: .alert)
        
        present(alert, animated: true, completion: nil)
    }
}
