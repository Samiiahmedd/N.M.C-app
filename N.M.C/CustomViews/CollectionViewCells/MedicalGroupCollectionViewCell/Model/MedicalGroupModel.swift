//
//  MedicalGroupModel.swift
//  N.M.C
//
//  Created by Sami Ahmed on 08/11/2023.
//

import Foundation

struct MedicalGroupModel : Codable {
    let data : [Category]
}

struct Category:Codable{
    let id: Int
    let category : String
    let image_url : String
}
