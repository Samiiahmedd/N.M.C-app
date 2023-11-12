//
//  CreateAccount.swift
//  N.M.C
//
//  Created by Sami Ahmed on 06/11/2023.
//

import UIKit

class CreateAccountVC: UIViewController {
    
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var phoneNumberField: UITextField!
    @IBOutlet weak var secondNameField: UITextField!
    @IBOutlet weak var firstNameField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        CreateAccountViewModel.shared.responseHandler = { [weak self] result in
            switch result {
            case .success:
                DispatchQueue.main.async {
                    let tapBar = mainTabBar()
                    tapBar.modalPresentationStyle = .overFullScreen
                    tapBar.modalTransitionStyle = .crossDissolve
                    self?.present(tapBar, animated: true)
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self?.displayValidationAlert(message: error.localizedDescription)
                }
            }
        }
    }
    
    //    deinit {
    //        print("deinited")
    //    }
    
    @IBAction func HomeGuestt(_ sender: Any) {
        let tapBar = mainTabBar()
        tapBar.modalPresentationStyle = .overFullScreen
        tapBar.modalTransitionStyle = .crossDissolve
        self.present(tapBar, animated: true)
    }
    
    @IBAction func CreateAccountButton(_ sender: Any) {
        if validateFields() {
            CreateAccountViewModel.shared.registerAuthentication(email: emailField.text!,  firstName: firstNameField.text!, LastName: secondNameField.text!, phoneNumber: phoneNumberField.text!, password: passwordField.text!)
        }
        
    }
    
    @IBAction func LoginBtn(_ sender: UIButton) {
        let loginVC = LoginVC()
        self.navigationController?.pushViewController(loginVC, animated: true)
    }
    
    func validateFields() -> Bool {
        if firstNameField.text?.isEmpty ?? true ||
            secondNameField.text?.isEmpty ?? true ||
            phoneNumberField.text?.isEmpty ?? true ||
            emailField.text?.isEmpty ?? true ||
            passwordField.text?.isEmpty ?? true {
            displayValidationAlert(message: "Please fill in  fields.")
            return false
        }
        
        if !(phoneNumberField.text!.hasPrefix("010") ||
             phoneNumberField.text!.hasPrefix("011") ||
             phoneNumberField.text!.hasPrefix("012") ||
             phoneNumberField.text!.hasPrefix("015")) {
            displayValidationAlert(message: "Invalid Phone number")
            return false
        }
        
        if !isValidEmail(emailField.text!) {
            displayValidationAlert(message: "Invalid email format.")
            return false
        }
        
        return true
    }
    
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }
}


