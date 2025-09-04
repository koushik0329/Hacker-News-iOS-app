//
//  TextFieldViewController.swift
//  Hacker News iOS app
//
//  Created by Koushik Reddy Kambham on 9/2/25.
//

import UIKit

class TextFieldViewController : UIViewController, UITextFieldDelegate {
    var loginTextfield: UITextField!
    var passwordTextfield: UITextField!
    var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    func setupUI() {
        view.backgroundColor = .black
        
        label = UILabel()
        label.text = "LogIn to Your Account"
        label.textColor = .red
        label.font = .systemFont(ofSize: 25, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)
        
        loginTextfield = UITextField()
        loginTextfield.borderStyle = .roundedRect
        loginTextfield.placeholder = "Enter User Name"
        loginTextfield.delegate = self
        loginTextfield.textColor = .black
        loginTextfield.clearButtonMode = .whileEditing
        loginTextfield.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(loginTextfield)
        
        passwordTextfield = UITextField()
        passwordTextfield.borderStyle = .roundedRect
        passwordTextfield.placeholder = "Enter Password"
        passwordTextfield.delegate = self
        passwordTextfield.textColor = .black
        passwordTextfield.clearButtonMode = .whileEditing
        passwordTextfield.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(passwordTextfield)
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 200),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.heightAnchor.constraint(equalToConstant: 40),
            label.widthAnchor.constraint(equalToConstant: 300),
            
            loginTextfield.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginTextfield.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 25),
            loginTextfield.widthAnchor.constraint(equalToConstant: 300),
            loginTextfield.heightAnchor.constraint(equalToConstant: 40),
            
            passwordTextfield.topAnchor.constraint(equalTo: loginTextfield.bottomAnchor, constant: 25),
            passwordTextfield.leadingAnchor.constraint(equalTo: loginTextfield.leadingAnchor),
            passwordTextfield.trailingAnchor.constraint(equalTo: loginTextfield.trailingAnchor),
            passwordTextfield.heightAnchor.constraint(equalToConstant: 40),
            
        ])
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("text field began editing")
    }
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        print("editing text field")
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        print("clear button clicked")
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("return button clicked")
        textField.resignFirstResponder()
        return true
    }
    
    
}
