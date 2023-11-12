//
//  userData.swift
//  N.M.C
//
//  Created by Sami Ahmed on 13/11/2023.
//

import Foundation

var userKey = "UserKey"  //used as akey to store data in user defults

struct ClientData {
    static func chacheClientModel(client: User) -> Void {
        let userData = try! client.asDictionary()
        UserDefaults.standard.set(userData, forKey: userKey)
    }
    
    static func getClientModel() throws -> User {
        guard let cachedData = UserDefaults.standard.object(forKey: userKey) as? [String: Any] else { throw RequestError.noData }
        let data = try! JSONSerialization.data(withJSONObject: cachedData, options: .prettyPrinted)
        let decoder = JSONDecoder()
        do{
            let client = try decoder.decode(User.self, from: data)
            return client
        } catch {
            throw error
        }
    }
    
    static func resetDefaults() {
        let defaults = UserDefaults.standard
        let dictionary = defaults.dictionaryRepresentation()
        dictionary.keys.forEach { key in
            defaults.removeObject(forKey: userKey)
        }
    }
}
