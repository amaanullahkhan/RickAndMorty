//
//  NetworkError.swift
//  RickAndMorty
//
//  Created by Amaan Ullah on 25/10/2024.
//

import Foundation

enum NetworkError {
    case somethingWentWrong
}

extension NetworkError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .somethingWentWrong:
            Localizable.somethingWentWrong
        }
    }
}
