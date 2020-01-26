//
//  LoginVC.swift
//  UISwitchHomeWork
//
//  Created by Nikita Moskalenko on 1/23/20.
//  Copyright © 2020 Nikita Moskalenko. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
    
//  MARK: - Constants
    private let lableUSD = UILabel()
    private let textFieldUSD = UITextField()
    private let lableEUR = UILabel()
    private let textFieldEUR = UITextField()
    private let lableRUR = UILabel()
    private let textFieldRUR = UITextField()
    private let convertButton = UIButton()
    private let resultTextField = UITextField()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.green
        
//      add USD Lable
        view.addSubview(lableUSD)
        lableUSD.text = "USD:"
        lableUSD.frame = CGRect(x: 120, y: 200, width: 50, height: 25)
        
//      add USD TextField
        view.addSubview(textFieldUSD)
        textFieldUSD.frame = CGRect(x: 120, y: 230, width: 180, height: 25)
        textFieldUSD.backgroundColor = .white
        
//      add EUR Lable
        view.addSubview(lableEUR)
        lableEUR.text = "EUR:"
        lableEUR.frame = CGRect(x: 120, y: 270, width: 50, height: 25)
        
//      add EUR TextField
        view.addSubview(textFieldEUR)
        textFieldEUR.frame = CGRect(x: 120, y: 300, width: 180, height: 25)
        textFieldEUR.backgroundColor = .white
        
//      add RUR Lable
        view.addSubview(lableRUR)
        lableRUR.text = "RUB:"
        lableRUR.frame = CGRect(x: 120, y: 340, width: 50, height: 25)
        
//      add RUR TextField
        view.addSubview(textFieldRUR)
        textFieldRUR.frame = CGRect(x: 120, y: 370, width: 180, height: 25)
        textFieldRUR.backgroundColor = .white
        
//      add convert Button
        view.addSubview(convertButton)
        convertButton.frame = CGRect(x: 160, y: 410, width: 100, height: 30)
        convertButton.setTitle("Convert", for: .normal)
        convertButton.backgroundColor = .red
        convertButton.addTarget(self, action: #selector(USDcurrencyExchange), for: .touchUpInside)
        
//      add result textField
        view.addSubview(resultTextField)
        resultTextField.backgroundColor = .white
        resultTextField.frame = CGRect(x: 120, y: 450, width: 180, height: 25)
    }
    
//  MARK: - Public methods
    
    @objc func USDcurrencyExchange() {
        if let usdTextField = textFieldUSD.text, let eurTextField = textFieldEUR.text, let rubTextField = textFieldRUR.text {
            
            if usdTextField.count != 0 {
                resultTextField.text = "\((Double(usdTextField)!) * 2.17)"
            } else if eurTextField.count != 0 {
                resultTextField.text = "\((Double(eurTextField)!) * 2.33)"
            } else if rubTextField.count != 0 {
                resultTextField.text = "\((Double(rubTextField)!) * 0.034)"
            } else {
                let alertController = UIAlertController(title: "Wraning", message: "Pleas enter value", preferredStyle: .alert)
                let alertAction = UIAlertAction(title: "Ok", style: .cancel) { (action) in
                }
                
                alertController.addAction(alertAction)
                self.present(alertController, animated: true)
            }
        }
    }
    
}
