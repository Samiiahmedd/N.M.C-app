//
//  medicalNetworkDetailsModel.swift
//  N.M.C
//
//  Created by Sami Ahmed on 23/11/2023.
//

import Foundation

struct medicalNetworkDetailsModel : Codable {
    let data : Details
}

struct Details:Codable{
    let id: Int
    let category: String
    let image_url: String
    let serviceProvider: String
    let governorate: String
    let region: String
    let discountPercentage: String?
    let specialization: String
    let address: String
    let phoneNumber: String?
    let appointments: String?
}



