//
//  latestContractsView.swift
//  N.M.C
//
//  Created by Sami Ahmed on 09/11/2023.
//

import Foundation
import UIKit

class  latestContractsView: UIView {
    override init (frame : CGRect){
        super.init(frame:frame)
        initialSetup()

    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initialSetup()
    }
    
    private func initialSetup(){
        layer.borderWidth = 2
        layer.borderColor = UIColor(named: "Color 4")?.cgColor
        
    }

}
