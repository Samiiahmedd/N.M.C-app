//
//  bannerModel.swift
//  N.M.C
//
//  Created by Sami Ahmed on 12/11/2023.
//

import Foundation
struct bannerModel : Codable {
    let data : [slide]
    
}
struct slide :Codable{
    let id: Int
    let image_url : String
}
