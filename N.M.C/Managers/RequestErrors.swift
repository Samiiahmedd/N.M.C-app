//
//  RequestErrors.swift
//  N.M.C
//
//  Created by Sami Ahmed on 13/11/2023.
//

import Foundation

enum RequestError: Error, LocalizedError {
    case decode
    case forbidden
    case unknown
    case notAllowed
    case validationError
    case notFounded
    case unAuth
    case timeOut
    case invalidURL
    case noResponse
    case unauthorized
    case unexpectedStatusCode
    
    case noData
        
    var errorDescription: String? {
        switch self {
        case .decode:
            return NSLocalizedString("Decode error", comment: "")
        case .forbidden:
            return NSLocalizedString("You don't have access to this", comment: "")
        case .unknown:
            return NSLocalizedString("Unknown error please try again later", comment: "")
        case .notAllowed:
            return NSLocalizedString("This method is not allowed", comment: "")
        case .validationError:
            return NSLocalizedString("Validation error check your data", comment: "")
        case .notFounded:
            return NSLocalizedString("This method is not founded", comment: "")
        case .unAuth:
            return NSLocalizedString("You don't have access", comment: "")
        case .timeOut:
            return NSLocalizedString("Time out please try again later", comment: "")
        case .invalidURL:
            return NSLocalizedString("Invalid URL Please try agine later.", comment: "")
        case .noResponse:
            return NSLocalizedString("Woops, invalid URL Please try agine later.", comment: "")
        case .unauthorized:
            return NSLocalizedString("Woops, invalid URL Please try agine later.", comment: "")
        case .unexpectedStatusCode:
            return NSLocalizedString("Woops, invalid URL Please try agine later.", comment: "")
        case .noData:
            return NSLocalizedString("There is no data to show.", comment: "")
        }
    }
}
