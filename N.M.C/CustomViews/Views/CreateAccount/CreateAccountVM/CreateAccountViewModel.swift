//
//  CreateAccountViewModel.swift
//  N.M.C
//
//  Created by Sami Ahmed on 08/11/2023.
//

import Foundation
class CreateAccountViewModel{
    static let shared = CreateAccountViewModel()
    var responseHandler: ((_ result: Result<User, Error>) -> Void)?
    
    private init() { }
    
    @MainActor
    func registerAuthentication(email: String, firstName:String,LastName:String,phoneNumber:String,password:String) {
        let body = [
            "password" : password,
            "phoneNumber": phoneNumber,
            "firstName" : firstName,
            "LastName" : LastName,
            "email" : email
        ]
        
        guard let url = URL(string:"https://api.nmc.com.eg/public/api/auth/register") else { return }
        var request = URLRequest (url: url)
        request.httpMethod = "POST"
        
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        guard let httpBody = try? JSONSerialization.data(withJSONObject: body, options: .prettyPrinted) else {return}
        request.httpBody = httpBody
        
        let session = URLSession.shared
        session.dataTask(with: request) { data, response, error in
            guard error == nil else { return }
            guard let data = data else {
                print("No data received")
                return
            }
            
            do{
                let user = try JSONDecoder().decode(User.self, from: data)
                ClientData.chacheClientModel(client: user)
                self.responseHandler?(.success(user))
            }catch{
                self.responseHandler?(.failure(error))
            }
            
        }.resume()
    }
}
