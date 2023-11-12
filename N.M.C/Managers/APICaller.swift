//
//  APICaller.swift
//  N.M.C
//
//  Created by Sami Ahmed on 09/11/2023.
//

import Foundation
struct Constants {
    static let baseURL = "https://api.nmc.com.eg/public/"
}

enum APIError : Error {
    case failedTogetData
    case invalidUrl
}

class APICaller {
    static let shared = APICaller()
    
    //SliderAPI
    @MainActor
    func getSliderApi(completion:@escaping (Result <bannerModel, Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)api/slider") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else{
                return
            }
            do{
                let results = try JSONDecoder().decode(bannerModel.self, from: data)
                print(data)
                completion(.success(results))
            }catch{
                completion(.failure(APIError.failedTogetData))
            }
        }
        task.resume()
    }
    
    //MedicalGroupAPI
    @MainActor
    func getMedicalGroupApi(completion:@escaping (Result <MedicalGroupModel, Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)api/category") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else{
                return
            }
            do{
                let results = try JSONDecoder().decode(MedicalGroupModel.self, from: data)
                print(data)
                completion(.success(results))
            }catch{
                completion(.failure(APIError.failedTogetData))
            }
        }
        task.resume()
    }
    
    
    
    // Get category by category
    @MainActor
    func getMedicalByCategory(path: String, completion:@escaping (Result <MedicalGroupAllModel, Error>) -> Void) {
        guard let encodedCategory = path.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) else {
            completion(.failure(APIError.invalidUrl))
            return
        }

        guard let url = URL(string: "https://api.nmc.com.eg/public/api/getMedicalNetworkByCategory/\(encodedCategory)") else {
            completion(.failure(APIError.invalidUrl))
            return
        }
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else{
                completion(.failure(APIError.failedTogetData))
                return
            }
            do{
                let results = try JSONDecoder().decode(MedicalGroupAllModel.self, from: data)
                print(data)
                completion(.success(results))
            }catch{
                print(error.localizedDescription)
                completion(.failure(APIError.failedTogetData))
            }
        }
        task.resume()
    }

    //MedicalUpgradeAPI
    @MainActor
    func getMedicalUpgradeAPI (completion:@escaping (Result <MedicalGroupModel, Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)api/lastCategory") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else{
                return
            }
            do{
                let results = try JSONDecoder().decode(MedicalGroupModel.self, from: data)
                print(data)
                completion(.success(results))
            }catch{
                completion(.failure(APIError.failedTogetData))
            }
        }
        task.resume()
    }
    
    
    //lastEngagements
    @MainActor
    func  getlatestEnagementsApi(completion:@escaping (Result <latestContractsModel, Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)api/lastEngagements") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else{
                return
            }
            do{
                let results = try JSONDecoder().decode(latestContractsModel.self, from: data)
                print(data)
                completion(.success(results))
            }catch{
                completion(.failure(APIError.failedTogetData))
            }
        }
        task.resume()
    }
    
    //medicalNetworkDetails
    @MainActor
    func  medicalNetworkDetails(completion:@escaping (Result <MedicalGroupAllModel, Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)api/getCategoryProductCounts") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            guard let data = data, error == nil else{
                return
            }
            do{
                let results = try JSONDecoder().decode(MedicalGroupAllModel.self, from: data)
                completion(.success(results))
            }catch{
                completion(.failure(APIError.failedTogetData))
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
    
    //API MedicalNetworkCategory Details
    @MainActor
    func  medicalNetworkCategoryDetails(id: Int, completion:@escaping (Result <medicalNetworkDetailsModel, Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)api/getItemMedicalNetwork/\(id)") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            guard let data = data, error == nil else{
                return
            }
            if let jsonString = String(data: data, encoding: .utf8) {
               print(jsonString)
            }
            do{
                let results = try JSONDecoder().decode(medicalNetworkDetailsModel.self, from: data)
                completion(.success(results))
            }catch{
                completion(.failure(APIError.failedTogetData))
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
    
}

