//
//  latestContractsModel.swift
//  N.M.C
//
//  Created by Sami Ahmed on 09/11/2023.
//

import Foundation
struct latestContractsModel : Codable {
    let data : [image]
    
}
struct image :Codable{
    let id: Int
    let image_url : String
}
