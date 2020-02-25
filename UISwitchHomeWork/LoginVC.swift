//
//  LoginVC.swift
//  UISwitchHomeWork
//
//  Created by Nikita Moskalenko on 1/23/20.
//  Copyright © 2020 Nikita Moskalenko. All rights reserved.
//

import UIKit

final class LoginVC: UIViewController {
    
//  MARK: - Constants
    private let labelUSD = UILabel()
    private let textFieldUSD = UITextField()
    private let labelEUR = UILabel()
    private let textFieldEUR = UITextField()
    private let labelRUB = UILabel()
    private let textFieldRUR = UITextField()
    private let convertButton = UIButton()
    private let resultTextField = UITextField()
        
     enum typeOfCurrency {
         case USD
         case EUR
         case RUB
         
         var foriengCurrency: String {
             switch self {
             case .USD:
                 return "USD:"
             case .EUR:
                 return "EUR:"
             case .RUB:
                 return "RUB:"
             }
         }
     }
    
//    MARK: - Provate methods
    
//      add USD Lable & TextField
    private func addUSD() {
        view.addSubview(labelUSD)
        labelUSD.text = typeOfCurrency.USD.foriengCurrency
        labelUSD.frame = CGRect(x: 120, y: 200, width: 50, height: 25)
        
        view.addSubview(textFieldUSD)
        textFieldUSD.frame = CGRect(x: 120, y: 230, width: 180, height: 25)
        textFieldUSD.backgroundColor = .white
    }
 
//      add EUR label & TextField
    private func addEUR() {
        view.addSubview(labelEUR)
        labelEUR.text = typeOfCurrency.EUR.foriengCurrency
        labelEUR.frame = CGRect(x: 120, y: 270, width: 50, height: 25)
        
        view.addSubview(textFieldEUR)
        textFieldEUR.frame = CGRect(x: 120, y: 300, width: 180, height: 25)
        textFieldEUR.backgroundColor = .white
    }
    
//      add RUB Label & TextField
    private func addRUB() {
        view.addSubview(labelRUB)
        labelRUB.text = typeOfCurrency.RUB.foriengCurrency
        labelRUB.frame = CGRect(x: 120, y: 340, width: 50, height: 25)
        
        view.addSubview(textFieldRUR)
        textFieldRUR.frame = CGRect(x: 120, y: 370, width: 180, height: 25)
        textFieldRUR.backgroundColor = .white
    }
    
// add Button to convert currency
    private func addConvertButton() {
        view.addSubview(convertButton)
        convertButton.frame = CGRect(x: 160, y: 410, width: 100, height: 30)
        convertButton.setTitle("Convert", for: .normal)
        convertButton.backgroundColor = .red
        convertButton.addTarget(self, action: #selector(USDcurrencyExchange), for: .touchUpInside)
    }
    
//   add resulting text field
    private func addResultTextField() {
        view.addSubview(resultTextField)
        resultTextField.backgroundColor = .white
        resultTextField.frame = CGRect(x: 120, y: 450, width: 180, height: 25)
    }
    
//   add allert controller "Pleas enter the value"
    private func createdAlertController() {
        let alertController = UIAlertController(title: "Wraning", message: "Pleas enter value", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        
        alertController.addAction(alertAction)
        self.present(alertController, animated: true)
    }
    
    override func viewDidLoad() {
          super.viewDidLoad()
          
          view.backgroundColor = UIColor.green
        
        addUSD()
        addEUR()
        addRUB()
        addConvertButton()
        addResultTextField()
      }
    
//  MARK: - Public methods
    
    @objc func USDcurrencyExchange() {
        if let usdTextField = textFieldUSD.text, let eurTextField = textFieldEUR.text, let rubTextField = textFieldRUR.text {
            
            if usdTextField.count != 0, let doubleUSD = Double(usdTextField) {
                resultTextField.text = "\(doubleUSD * 2.17)"
            } else if eurTextField.count != 0, let doubleEUR = Double(eurTextField) {
                resultTextField.text = "\(doubleEUR * 2.33)"
            } else if rubTextField.count != 0, let doublRUB = Double(rubTextField) {
                resultTextField.text = "\(doublRUB * 0.034)"
            } else {
                createdAlertController()
            }
        }
    }
    
}
