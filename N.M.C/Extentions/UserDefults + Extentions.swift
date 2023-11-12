//
//  UserDefaults+Extensions.swift
//  N.M.C
//
//  Created by Sami Ahmed on 22/11/2023.
//

import Foundation

extension UserDefaults {
    private enum UserDefaultsKey: String {
        case hasOnboarded
        case isLogged
    }

    var hasOnboarded: Bool {
        get {
            bool(forKey: UserDefaultsKey.hasOnboarded.rawValue)
        }

        set {
            setValue(newValue, forKey: UserDefaultsKey.hasOnboarded.rawValue)
        }
    }

    var isLogged: Bool {
        get {
            bool(forKey: UserDefaultsKey.isLogged.rawValue)
        }

        set {
            setValue(newValue, forKey: UserDefaultsKey.isLogged.rawValue)
        }
    }
}
