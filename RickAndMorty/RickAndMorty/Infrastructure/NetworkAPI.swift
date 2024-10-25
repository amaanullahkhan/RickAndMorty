//
//  Network.swift
//  RickAndMorty
//
//  Created by Amaan Ullah on 25/10/2024.
//

import Foundation

enum NetworkAPI {

    enum Constant {
        static let api = "api"
        static let character = "character"
        static let page = "page"
    }
    
    enum URLs {
        static let baseURL = URL(string: "https://rickandmortyapi.com/")!
        static let charactersURL = baseURL.appending(path: Constant.api).appending(path: Constant.character)
    }
    
}
