//
//  LoginViewModel.swift
//  N.M.C
//
//  Created by Sami Ahmed on 07/11/2023.
//

import Foundation

class LoginViewModel {
    static let shared = LoginViewModel()
    var responseHandler: ((_ result: Result<User, Error>) -> Void)?

    private init() { }

    @MainActor
    func logiuthentication(phoneNumber: String, password: String) {
        let body = [
            "password": password,
            "phoneNumber": phoneNumber
        ]
        
        guard let url = URL(string:"https://api.nmc.com.eg/public/api/auth/login") else { return }
        var request = URLRequest (url: url)
        request.httpMethod = "POST"
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        guard let httpBody = try? JSONSerialization.data(withJSONObject: body, options: .fragmentsAllowed) else {return}
        request.httpBody = httpBody
        
        let session = URLSession.shared
        session.dataTask(with: request) { [weak self] data, response, error in
            guard error == nil else { return }
            guard let data = data else { return }
            do{
                let user = try JSONDecoder().decode(User.self, from: data)
                ClientData.chacheClientModel(client: user)
                self?.responseHandler?(.success(user))
                print(user)

            }catch{
                self?.responseHandler?(.failure(error))
            }
        }.resume()
    }
    }
    
