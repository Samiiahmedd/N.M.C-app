//
//  NavigationController.swift
//  N.M.C
//
//  Created by Sami Ahmed on 16/11/2023.
//

import UIKit
class GFNavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavigationController()
    }
    
    func setUpNavigationController() {
        if UserDefaults().hasOnboarded == true {
            self.viewControllers = [LoginVC()]
        }
        else {
            self.viewControllers = [onboardingVC()]
        }
        
        
    }
}

