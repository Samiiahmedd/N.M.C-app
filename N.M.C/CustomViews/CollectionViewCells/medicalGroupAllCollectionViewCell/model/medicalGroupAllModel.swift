//
//  medicalGroupAllModel.swift
//  N.M.C
//
//  Created by Sami Ahmed on 16/11/2023.
//

import Foundation

struct MedicalGroupAllModel : Codable {
    let data : [medicalgroup]
}

struct medicalgroup:Codable{
    let id: Int?
    let MedicalNetwork : Int?
    let category: String
    let image_url : String
    let serviceProvider : String?
}
