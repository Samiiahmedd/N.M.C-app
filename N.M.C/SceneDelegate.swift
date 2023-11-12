//
//  SceneDelegate.swift
//  N.M.C
//
//  Created by Sami Ahmed on 04/11/2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene

        if UserDefaults().isLogged == true {
            window?.rootViewController = mainTabBar()
        } else {
            window?.rootViewController = GFNavigationController()
        }
        window?.makeKeyAndVisible()
    }
}
