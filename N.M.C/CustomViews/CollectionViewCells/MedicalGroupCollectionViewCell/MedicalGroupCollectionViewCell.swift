//
//  MedicalGroupCollectionViewCell.swift
//  N.M.C
//
//  Created by Sami Ahmed on 08/11/2023.
//

import UIKit
import Kingfisher

class MedicalGroupCollectionViewCell: UICollectionViewCell {
    static let identifer =  String(describing: MedicalGroupCollectionViewCell.self)
    
    @IBOutlet weak var MedicalGroupImage: UIImageView!
    @IBOutlet weak var MedicalGroupLabel: UILabel!
    
    func  setup(MedicalGroup: Category) {
        MedicalGroupLabel.text = MedicalGroup.category
        MedicalGroupImage.kf.setImage(with: MedicalGroup.image_url.asUrl)
    }
}
