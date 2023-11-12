//
//  String+Extentions.swift
//  N.M.C
//
//  Created by Sami Ahmed on 08/11/2023.
//

import Foundation
extension String {
    var asUrl: URL? {
        guard let encodedString = self.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {
            return nil
        }
        return URL(string: encodedString)
    }
}
