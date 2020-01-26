//
//  ViewController.swift
//  UISwitchHomeWork
//
//  Created by Nikita Moskalenko on 1/22/20.
//  Copyright © 2020 Nikita Moskalenko. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

//  MARK: - Constants

    private let namedTextField = UITextField()
    private let loginLable = UILabel()
    private let passwordTextField = UITextField()
    private let passwordLable = UILabel()
    private let loginButton = UIButton()
    private let acceptLable = UILabel()
    private let acceptSwitch = UISwitch()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.green
        
//      add loginLable
        view.addSubview(loginLable)
        loginLable.text = "Login:"
        loginLable.textColor = .black
        loginLable.frame = CGRect(x: 120, y: 325, width: 50, height: 25)
        
        
//      add namedTexteField
        view.addSubview(namedTextField)
        namedTextField.frame = CGRect(x: 120, y: 350, width: 180, height: 25)
        namedTextField.backgroundColor = UIColor.white
        namedTextField.placeholder = "Enter your login..."
        namedTextField.textAlignment = .center
        namedTextField.textColor = UIColor.black
        
//      add passwordLable
        view.addSubview(passwordLable)
        passwordLable.text = "Password:"
        passwordLable.textColor = .black
        passwordLable.frame = CGRect(x: 120, y: 390, width: 100, height: 25)
        
//      add passwordTextField
        view.addSubview(passwordTextField)
        passwordTextField.frame = CGRect(x: 120, y: 415, width: 180, height: 25)
        passwordTextField.backgroundColor = UIColor.white
        passwordTextField.placeholder = "Enter your password..."
        passwordTextField.textAlignment = .center
        passwordTextField.textColor = UIColor.black
        passwordTextField.isSecureTextEntry = true
        
//      add loginButton
        view.addSubview(loginButton)
        loginButton.setTitle("Login", for: .normal)
        loginButton.frame = CGRect(x: 160, y: 445, width: 100, height: 30)
        loginButton.backgroundColor = .red
        loginButton.addTarget(self, action: #selector(showSecondViewController), for: .touchUpInside)
        
//      add Accept Lable
        view.addSubview(acceptLable)
        acceptLable.text = "I'm alredy reading and agree with rule..."
        acceptLable.frame = CGRect(x: 140, y: 485, width: 200, height: 25)
        acceptLable.textColor = .red
        
//      add Switch
        view.addSubview(acceptSwitch)
        acceptSwitch.frame = CGRect(x: 80, y: 485, width: 0, height: 0)
        acceptSwitch.addTarget(self, action: #selector(showSecondViewController), for: .valueChanged)
        
    }
    
//   MARK: - Private methods
    
    @objc private  func showSecondViewController() {
        if let loginCount = namedTextField.text?.count, let paswordCount = passwordTextField.text?.count {
              if loginCount == 0, paswordCount == 0 {
                  let wraningMessage = UIAlertController(title: "Wraning", message: "Your password or email isn't corrected", preferredStyle: .actionSheet)
                  let action = UIAlertAction(title: "Ok", style: .cancel) { (action) in
                  }
                  
                  wraningMessage.addAction(action)
                  present(wraningMessage, animated: true)
              } else if acceptSwitch.isOn {
                  let secondVC = LoginVC()
                  present(secondVC, animated: true)
              } else {
                  let alertController = UIAlertController(title: "Wraning", message: "Pleas accept the rules", preferredStyle: .alert)
                  let alertAction = UIAlertAction(title: "OK", style: .cancel) { (alertAction) in
                  }
                  
                  alertController.addAction(alertAction)
                  self.present(alertController, animated: true)
              }
          }
      }
    
}

