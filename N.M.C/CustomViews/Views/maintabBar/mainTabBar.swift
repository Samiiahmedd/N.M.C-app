//
//  mainTabBar.swift
//  N.M.C
//
//  Created by Sami Ahmed on 15/11/2023.
//

import UIKit

class mainTabBar: UITabBarController {
    
    // MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        UITabBar.appearance().tintColor = UIColor(named: "Color 4")
        viewControllers = [homeNC(), medicalNetworkNC(), medicalCardNC(), profileNC()]
        selectedIndex = 0
    }
    
    //MARK: - Functions
    func homeNC() -> UINavigationController {
        let mainVC = HomVC()
        mainVC.title = ""
        mainVC.tabBarItem = UITabBarItem(title: "الرئيسية", image: UIImage(systemName: "house.fill"), tag: 1)
        mainVC.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: "Cairo-SemiBold", size: 12) ?? UIFont.systemFont(ofSize: 12, weight: .semibold)], for: .normal)
        
        return UINavigationController(rootViewController: mainVC)
    }
    
    func medicalNetworkNC() -> UINavigationController {
        let medicalNetwork = MedicalNetworkVC()
        medicalNetwork.title = ""
        medicalNetwork.tabBarItem = UITabBarItem(title: "الشبكة الطبية", image: UIImage(systemName: "network"), tag: 2)
        medicalNetwork.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: "Cairo-SemiBold", size: 12) ?? UIFont.systemFont(ofSize: 12, weight: .semibold)], for: .normal)
        return UINavigationController(rootViewController: medicalNetwork)
    }
    
    func medicalCardNC() -> UINavigationController {
        let medicalCard = medicalCardApplicationVC()
        medicalCard.title      = ""
        medicalCard.tabBarItem = UITabBarItem(title: "الكارت الطبي", image: UIImage(systemName: "creditcard"), tag: 3)
        medicalCard.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: "Cairo-SemiBold", size: 12) ?? UIFont.systemFont(ofSize: 12, weight: .semibold)], for: .normal)
        
        return UINavigationController(rootViewController: medicalCard)
    }
    
    func profileNC() -> UINavigationController {
        let profile = ProfileVC()
        profile.title = ""
        profile.tabBarItem = UITabBarItem(title: "الملف الشخصي", image: UIImage(systemName: "person.circle"), tag: 4)
        profile.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: "Cairo-SemiBold", size: 12) ?? UIFont.systemFont(ofSize: 12, weight: .semibold)], for: .normal)
        return UINavigationController(rootViewController: profile)
    }
}

