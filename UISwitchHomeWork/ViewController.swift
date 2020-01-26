//
//  ViewController.swift
//  UISwitchHomeWork
//
//  Created by Nikita Moskalenko on 1/22/20.
//  Copyright © 2020 Nikita Moskalenko. All rights reserved.
//

import UIKit

final class ViewController: UIViewController, UITextFieldDelegate {

//  MARK: - Constants

    private let namedTextField = UITextField()
    private let loginLabel = UILabel()
    private let passwordTextField = UITextField()
    private let passwordLable = UILabel()
    private let loginButton = UIButton()
    private let acceptLabel = UILabel()
    private let acceptSwitch = UISwitch()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.green
   
    }
    
//   MARK: - Private methods
    
//   created loginLabel
    private func addLoginLabel() {
        view.addSubview(loginLabel)
        loginLabel.text = "Login:"
        loginLabel.textColor = .black
        loginLabel.frame = CGRect(x: 120, y: 325, width: 50, height: 25)
    }
    
//  created namedTextField
    private func addNamedTextField() {
        view.addSubview(namedTextField)
        namedTextField.frame = CGRect(x: 120, y: 350, width: 180, height: 25)
        namedTextField.backgroundColor = UIColor.white
        namedTextField.placeholder = "Enter your login..."
        namedTextField.textAlignment = .center
        namedTextField.textColor = UIColor.black
    }
    
//   created password label
    private func addPasswordLabel() {
        view.addSubview(passwordLable)
        passwordLable.text = "Password:"
        passwordLable.textColor = .black
        passwordLable.frame = CGRect(x: 120, y: 390, width: 100, height: 25)
    }
    
//   created password text field
    private func addPasswordTextField() {
        view.addSubview(passwordTextField)
        passwordTextField.frame = CGRect(x: 120, y: 415, width: 180, height: 25)
        passwordTextField.backgroundColor = UIColor.white
        passwordTextField.placeholder = "Enter your password..."
        passwordTextField.textAlignment = .center
        passwordTextField.textColor = UIColor.black
        passwordTextField.isSecureTextEntry = true
    }
    
//   created login button
    private func addLoginButton() {
        view.addSubview(loginButton)
        loginButton.setTitle("Login", for: .normal)
        loginButton.frame = CGRect(x: 160, y: 445, width: 100, height: 30)
        loginButton.backgroundColor = .red
        loginButton.addTarget(self, action: #selector(showSecondViewController), for: .touchUpInside)
    }
    
//   created accept label
    private func addAcceptLabel() {
        view.addSubview(acceptLabel)
        acceptLabel.text = "I'm alredy reading and agree with rule..."
        acceptLabel.frame = CGRect(x: 140, y: 485, width: 200, height: 25)
        acceptLabel.textColor = .red
    }
    
//   created switch
    private func addSwitchElement() {
        view.addSubview(acceptSwitch)
        acceptSwitch.frame = CGRect(x: 80, y: 485, width: 0, height: 0)
        acceptSwitch.addTarget(self, action: #selector(showSecondViewController), for: .valueChanged)
    }
    
//    crated alert controllers
    private func createdAlertControllers(titleAction: String, titleAC: String, message: String, styleAction: UIAlertAction.Style ,styleAC: UIAlertController.Style) {
        let newAlerController = UIAlertController(title: titleAC, message: message, preferredStyle: styleAC)
        let newAlertAction = UIAlertAction(title: titleAction, style: styleAction, handler: nil)
        
        newAlerController.addAction(newAlertAction)
        present(newAlerController, animated: true)
    }

// the condition for crossing to second VC
    @objc private  func showSecondViewController() {
//      optinal binding
        if let loginCount = namedTextField.text?.count, let paswordCount = passwordTextField.text?.count {
              if loginCount == 0, paswordCount == 0 {
//                add alert
                createdAlertControllers(titleAction: "Ok", titleAC: "Wraning", message: "Your password or email isn't corrected", styleAction: .cancel, styleAC: .alert)
                
              } else if acceptSwitch.isOn {
                  let secondVC = LoginVC()
                  present(secondVC, animated: true)
              } else {
                createdAlertControllers(titleAction: "Ok", titleAC: "Wraning", message: "Pleas accept the rules", styleAction: .cancel, styleAC: .alert)
              }
          }
      }
    
}

