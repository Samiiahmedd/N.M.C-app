//
//  editProfileVC.swift
//  N.M.C
//
//  Created by Sami Ahmed on 13/11/2023.
//

import UIKit
import SwiftUI

class editProfileVC: UIViewController {
    
    //MARK: - @IBOutlet
    @IBOutlet weak var profileNamelabel: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    
    //MARK: - viewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        editProfileViewModel.shared.responseHandler = { [weak self] result in
            switch result {
            case .success:
                DispatchQueue.main.async {
                    let HomeVc = HomVC ()
                    self?.navigationController?.pushViewController(HomeVc, animated: true)
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self?.displayValidationAlert(message: error.localizedDescription)
                }
            }
        }
        profileImage.layer.borderWidth = 4
        profileImage.layer.borderColor = UIColor.white.cgColor
        nameTextField.layer.borderWidth = 1
        nameTextField.layer.borderColor = UIColor(named: "Color 4")?.cgColor
        emailTextField.layer.borderWidth = 1
        emailTextField.layer.borderColor = UIColor(named: "Color 4")?.cgColor
        phoneTextField.layer.borderWidth = 1
        phoneTextField.layer.borderColor = UIColor(named: "Color 4")?.cgColor
    }
    
    //MARK: - @IBAction
    @IBAction func saveButtom(_ sender: Any) {
        editProfileViewModel.shared.editProfile(name: nameTextField.text!, email: emailTextField.text!, phoneNumber: phoneTextField.text!)
        
    }
    
}
