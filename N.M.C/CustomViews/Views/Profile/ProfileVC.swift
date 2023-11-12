//
//  ProfileVC.swift
//  N.M.C
//
//  Created by Sami Ahmed on 12/11/2023.
//

import UIKit

class ProfileVC: UIViewController {
    
    //MARK: - IBOutlet
    @IBOutlet weak var headerImage: UIImageView!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var secondView: UIView!
    
    //MARK: - viewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        profileImage.layer.borderWidth = 4
        profileImage.layer.borderColor = UIColor.white.cgColor
        
        secondView.layer.shadowColor = UIColor.black.cgColor
        secondView.layer.shadowOpacity = 0.2
        secondView.layer.shadowRadius = 4
        secondView.layer.shadowOffset = CGSize(width: 0, height: 1)
    }
    
    //MARK: - @IBAction
    @IBAction func editProfileButton(_ sender: UIButton) {
        let editprofileVC = editProfileVC()
        self.navigationController?.pushViewController(editprofileVC, animated: true)
    }
    
    @IBAction func privacyButton(_ sender: Any) {
        let privacyVC = PrivaccyVC()
        self.navigationController?.pushViewController(privacyVC, animated: true)
    }
    
    @IBAction func helpButton(_ sender: Any) {
        let supportAndHelp = supportPopUPVC()
        supportAndHelp.appear(sender: self)
        
    }
    
    @IBAction func deleteAccountButton(_ sender: Any) {
        
    }
    
    @IBAction func logoutButton(_ sender: Any) {
        UserDefaults().isLogged = false
        let loginvc = LoginVC()
        loginvc.modalPresentationStyle = .overFullScreen
        loginvc.modalTransitionStyle = .crossDissolve
        self.present(loginvc, animated: true)
    }
}

