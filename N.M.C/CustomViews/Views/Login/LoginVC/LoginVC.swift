//
//  LoginVC.swift
//  N.M.C
//
//  Created by Sami Ahmed on 06/11/2023.
//

import UIKit
class LoginVC: UIViewController {
    
    private var loader = UIAlertController()
    
    @IBOutlet weak var phonNumberTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        LoginViewModel.shared.responseHandler = { [weak self] result in
            self?.stopLoader(loader: self!.loader)
            switch result {
            case .success:
                UserDefaults().isLogged = true
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
    
    @IBAction func HomeGuest(_ sender: Any) {
        let tapBar = mainTabBar()
        tapBar.modalPresentationStyle = .overFullScreen
        tapBar.modalTransitionStyle = .crossDissolve
        self.present(tapBar, animated: true)

    }
    
    @IBAction func loginbutton(_ sender: Any) {
        if validateFields(){
            
            LoginViewModel.shared.logiuthentication(phoneNumber: phonNumberTextField.text!, password: passwordTextField.text!)
        }
        loader = self.loader()

        
    }
    
    @IBAction func CreateAccountBtn(_ sender: UIButton) {
        let createAccountVC = CreateAccountVC()
        self.navigationController?.pushViewController(createAccountVC, animated: true)
    }
    
    func validateFields() -> Bool {
        if phonNumberTextField.text?.isEmpty ?? true ||
            passwordTextField.text?.isEmpty ?? true {
            displayValidationAlert(message: "Please fill all fields")
            return false
        }
        
        if !(phonNumberTextField.text!.hasPrefix("010") ||
             phonNumberTextField.text!.hasPrefix("011") ||
             phonNumberTextField.text!.hasPrefix("012") ||
             phonNumberTextField.text!.hasPrefix("015")) {
            displayValidationAlert(message: "Invalid Phone number")
            return false
        }
        
        let phoneNumberWithoutPrefix = String(phonNumberTextField.text!.dropFirst(3))
        if phoneNumberWithoutPrefix.count != 8 {
            displayValidationAlert(message: "Phone number must be 11 digits")
            return false
        }
        return true
    }
}


extension UIViewController {
    func displayValidationAlert(message: String) {
        let alert = UIAlertController(title: "Error!", message: message, preferredStyle: .actionSheet)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
}
