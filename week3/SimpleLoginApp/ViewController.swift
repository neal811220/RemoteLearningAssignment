//
//  ViewController.swift
//  SimpleLoginApp
//
//  Created by Neal on 2019/11/18.
//  Copyright © 2019 neal812220. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var checkLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var switchSegmentedControl: UISegmentedControl!
    @IBOutlet weak var checkTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var accountTextField: UITextField!
    let testAccount = "appworks_school@gmail.com"
    let testPassword = "1234"
    override func viewDidLoad() {
        super.viewDidLoad()
        accountTextField.delegate = self
        passwordTextField.delegate = self
        checkTextField.delegate = self
        // Do any additional setup after loading the view.
    }
    
    @IBAction func segmentedAction(_ sender: UISegmentedControl) {
        if switchSegmentedControl.selectedSegmentIndex == 0 {
            checkLabel.textColor = .darkGray
            checkTextField.backgroundColor = .darkGray
            checkTextField.isUserInteractionEnabled = false
        }else {
            checkLabel.textColor = .black
            checkTextField.backgroundColor = .white
            checkTextField.isUserInteractionEnabled = true
        }
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    @IBAction func pressedButton(_ sender: UIButton) {
        if switchSegmentedControl.selectedSegmentIndex == 0 {
            if accountTextField.text == testAccount && passwordTextField.text == testPassword{
                successAlert(messge: "Sign in Suceesfully!")
                accountTextField.text = nil
                passwordTextField.text = nil
                checkTextField.text = nil
            }else if accountTextField.text == ""{
                errorAlert(message: "Account Should not be empty.")
            }else if accountTextField.text == nil || accountTextField.text != testAccount{
                errorAlert(message: "Account Input Wrong, Please tyr again!")
            }else if passwordTextField.text == "" {
                errorAlert(message: "Password Should not be empty.")
            }else if passwordTextField.text == nil || passwordTextField.text != testPassword{
                errorAlert(message: "Password Input Wrong, Please tyr again!")
            }
            
        }else if switchSegmentedControl.selectedSegmentIndex == 1{
            if accountTextField.text != nil && accountTextField.text != "" && passwordTextField.text != nil && passwordTextField.text != "" && checkTextField.text != nil && checkTextField.text != "" && passwordTextField.text == checkTextField.text{
                successAlert(messge: "Sign up Suceesfully!")
                accountTextField.text = nil
                passwordTextField.text = nil
                checkTextField.text = nil
                checkTextField.reloadInputViews()
            }else if accountTextField.text == ""{
                errorAlert(message: "Account Should not be empty.")
            }else if accountTextField.text == nil{
                errorAlert(message: "Account Input Wrong, Please tyr again!")
            }else if passwordTextField.text == "" {
                errorAlert(message: "Password Should not be empty.")
            }else if passwordTextField.text == nil{
                errorAlert(message: "Password Input Wrong, Please tyr again!")
            }else if checkTextField.text == "" {
                errorAlert(message: "Check Should not be empty.")
            }else if checkTextField.text == nil {
                errorAlert(message: "Check Input Wrong, Please tyr again!")
            }else if checkTextField.text != passwordTextField.text {
                errorAlert(message: "Password does not match check content！")
            }
            
        }
    }
    
    
    func errorAlert(message: String) {
        let alertController = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(alertAction)
        present(alertController, animated: true, completion: nil)
    }
    
    func successAlert(messge: String) {
        let alertController = UIAlertController(title: "Success!", message: messge, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(alertAction)
        present(alertController, animated: true, completion: nil)
    }
    
    
}

