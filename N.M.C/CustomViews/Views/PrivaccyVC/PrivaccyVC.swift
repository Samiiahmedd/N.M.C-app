//
//  PrivaccyVC.swift
//  N.M.C
//
//  Created by Sami Ahmed on 13/11/2023.
//

import UIKit

class PrivaccyVC: UIViewController {
    
    //MARK: - @IBOutlet
    @IBOutlet weak var privacyTitleLabel: UILabel!
    @IBOutlet weak var privacySecondDiscLabel: UILabel!
    @IBOutlet weak var privacyFirstDescLabel: UILabel!
    
    //MARK: - functions
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true

    }
}
