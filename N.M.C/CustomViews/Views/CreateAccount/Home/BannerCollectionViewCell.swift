//
//  BannerCollectionViewCell.swift
//  N.M.C
//
//  Created by Sami Ahmed on 08/11/2023.
//

import UIKit
import Kingfisher

class BannerCollectionViewCell: UICollectionViewCell {
    static let identifer = String(describing: BannerCollectionViewCell.self)
    
    @IBOutlet weak var bannerImageView: UIImageView!
    func setup(Banner: Slide){
        bannerImageView.kf.setImage(with: Banner.image_url.asUrl )
        
    }
}
