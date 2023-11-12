//
//  medicalGroupAllCollectionViewCell.swift
//  N.M.C
//
//  Created by Sami Ahmed on 16/11/2023.
//

import UIKit
import Kingfisher

class medicalGroupAllCollectionViewCell: UICollectionViewCell {
    static let identifer =  String(describing: medicalGroupAllCollectionViewCell.self)
    
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var medicalLabel: UILabel!
    
    func  setup(title: String, counter: Int?, imageUrl: String) {
        image.kf.setImage(with: imageUrl.asUrl)
        if let counter = counter {
            medicalLabel.text = title + " " + String(counter)
        } else {
            medicalLabel.text = title
        }
    }
}


