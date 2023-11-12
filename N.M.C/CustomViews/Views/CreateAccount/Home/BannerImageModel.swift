//
//  BannerImageModel.swift
//  N.M.C
//
//  Created by Sami Ahmed on 08/11/2023.
//

import Foundation

struct BannerImageModel:Codable {
     let data : [Slide]
}

struct Slide : Codable {
    let id: Int
    let image_url : String
}
