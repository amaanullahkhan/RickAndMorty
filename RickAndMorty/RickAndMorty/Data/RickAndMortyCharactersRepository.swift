//
//  RickAndMortyCharactersRepository.swift
//  RickAndMorty
//
//  Created by Amaan Ullah on 25/10/2024.
//

import Foundation

struct RickAndMortyCharactersRepository: CharactersRepository {
    
    let manager: NetworkRequestManager
    
    func fetchCharacters(for status: Status?) async throws -> [Character] {
        let request = NetworkRoute.RickAndMortyRoute.characters(status: status, next: nil)
        let response: Response = try await manager.perform(request: request)
        return response.results
    }
    
    struct Response: Decodable {
        
        let info: Info
        let results: [Character]
        
        struct Info: Decodable {
            let count: Int
            let pages: Int
            let next: URL?
        }
    }
}
