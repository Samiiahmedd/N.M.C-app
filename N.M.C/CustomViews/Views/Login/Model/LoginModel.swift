//
//  LoginModel.swift
//  N.M.C
//
//  Created by Sami Ahmed on 07/11/2023.
//

import Foundation
struct User: Codable {
    let status: Bool
    let msg: String
    let errNum: String?
    let client: Client
}

struct Client: Codable {
    let id: Int
    let firstName: String
    let LastName: String
    let phoneNumber: String
    let email: String
    let authToken: String?
}
