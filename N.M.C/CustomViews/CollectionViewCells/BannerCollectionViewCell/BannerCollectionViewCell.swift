//
//  BannerCollectionViewCell.swift
//  N.M.C
//
//  Created by Sami Ahmed on 12/11/2023.
//

import UIKit
import Kingfisher
class BannerCollectionViewCell: UICollectionViewCell {
    static let identifer = String(describing: BannerCollectionViewCell.self)
    
    @IBOutlet weak var bannerImageView: UIImageView!
    func setup(Banner: slide){
        bannerImageView.kf.setImage(with: Banner.image_url.asUrl )
        
        
    }
    
}
