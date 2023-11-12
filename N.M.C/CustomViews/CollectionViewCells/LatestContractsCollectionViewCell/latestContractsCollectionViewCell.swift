//
//  latestContractsCollectionViewCell.swift
//  N.M.C
//
//  Created by Sami Ahmed on 09/11/2023.
//

import UIKit
import Kingfisher

class latestContractsCollectionViewCell: UICollectionViewCell {
    static let identifer = String(describing: latestContractsCollectionViewCell.self)
    
    @IBOutlet weak var image: UIImageView!

    func setup(latestContracts:image){
        image.kf.setImage(with: latestContracts.image_url.asUrl)
    }
}
