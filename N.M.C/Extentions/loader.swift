//
//  loader.swift
//  N.M.C
//
//  Created by Sami Ahmed on 19/11/2023.
//

import UIKit
extension UIViewController {
    func loader() -> UIAlertController {
        let alert = UIAlertController(title: nil, message: "please wait", preferredStyle: .alert)
        let indicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
        indicator.hidesWhenStopped = true
        indicator.startAnimating()
        indicator.style = .large
        alert.view.addSubview(indicator)
        self.parent?.present(alert, animated: true,completion: nil)
        return alert
    }
    func stopLoader(loader:UIAlertController)  {
        DispatchQueue.main.async {
            loader.dismiss(animated:true, completion: nil)
        }
    }
}
