//
//  editProfileViewModel.swift
//  N.M.C
//
//  Created by Sami Ahmed on 13/11/2023.
//

import Foundation
class editProfileViewModel {
    static let shared = editProfileViewModel()
    var responseHandler: ((_ result: Result<User, Error>) -> Void)?
    
    
    private init() { }
    
    @MainActor
    func editProfile(name: String, email:String, phoneNumber: String) {
        let body = [
            "phoneNumber": phoneNumber,
            "name": name,
            "email" : email
        ]
        
        guard let url = URL(string:"https://api.nmc.com.eg/public/api/auth/edite-profile") else {return}
        var request = URLRequest (url: url)
        request.httpMethod = "POST"
        request.setValue("eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL2FwaS5ubWMuY29tLmVnL3B1YmxpYy9hcGkvYXV0aC9sb2dpbiIsImlhdCI6MTY5OTg4NTgwNCwiZXhwIjoxNjk5ODg5NDA0LCJuYmYiOjE2OTk4ODU4MDQsImp0aSI6Ild2cUNXcWlxbUR1aWdOb08iLCJzdWIiOiIyMTYiLCJwcnYiOiI0MWVmYjdiYWQ3ZjZmNjMyZTI0MDViZDNhNzkzYjhhNmJkZWM2Nzc3In0.svcCPLUyMiExN6hm3TUTZqKFLATnioT2NupVH11_jOg", forHTTPHeaderField: "Authorization")
        
        guard let httpBody = try? JSONSerialization.data(withJSONObject: body, options: .prettyPrinted) else {return}
        request.httpBody = httpBody
        
        let session = URLSession.shared
        session.dataTask(with: request) { data, response, error in
            print(response!)
            guard error == nil else { return }
            guard let data = data else {
                print("No data received")
                return
            }
            
            do{
                let user = try JSONDecoder().decode(User.self, from: data)
                ClientData.chacheClientModel(client: user)
                self.responseHandler?(.success(user))
                print(user)
            }catch{
                self.responseHandler?(.failure(error))
            }
            
        }.resume()
    }
}
