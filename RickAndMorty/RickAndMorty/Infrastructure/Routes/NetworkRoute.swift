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
                
        case characters(status: Status?, next: URL?)
        
        var method: HTTPMethod {
            switch self {
            case .characters:
                .get
            }
        }
        
        var route: URL {
            switch self {
            case .characters(_, let next):
                if let next {
                    return next
                }
                return NetworkAPI.URLs.charactersURL
            }
        }
        
        var queryParams: Parameters? {
            switch self {
            case .characters(let status, let next):
                guard next == nil else {
                    return nil
                }
                if let status {
                    return [URLQueryItem(name: Constant.status, value: status.key)]
                }
                return nil
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

private extension Status {
    var key: String {
        switch self {
        case .alive:
            "alive"
        case .dead:
            "dead"
        case .unknown:
            "unknown"
        }
    }
}

