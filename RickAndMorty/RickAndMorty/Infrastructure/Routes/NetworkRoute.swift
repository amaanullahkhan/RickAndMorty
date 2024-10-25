//
//  Router.swift
//  RickAndMorty
//
//  Created by Amaan Ullah on 25/10/2024.
//

import Foundation

typealias Constant = NetworkAPI.Constant

enum NetworkRoute {
        
    enum RickAndMortyRoute: NetworkRequest {
                
        case characters
        
        var method: HTTPMethod {
            switch self {
            case .characters:
                .get
            }
        }
        
        var route: URL {
            switch self {
            case .characters:
                NetworkAPI.URLs.charactersURL
            }
        }
        
        var queryParams: Parameters? {
            switch self {
            case .characters:
                nil
            }
        }
        
        var bodyParam: Encodable? {
            switch self {
            case .characters:
                nil
            }
        }
        
    }
}

