//
//  UIView+Extentions.swift
//  N.M.C
//
//  Created by Sami Ahmed on 04/11/2023.
//
import UIKit
import Foundation
extension UIView {
     @IBInspectable var cornerRadius: CGFloat {
         get{return self.cornerRadius}
        set {
            self.layer.cornerRadius = newValue
        }
    }
    
    
}
