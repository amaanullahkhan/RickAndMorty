//
//  RickAndMortyCharactersRepository.swift
//  RickAndMorty
//
//  Created by Amaan Ullah on 25/10/2024.
//

import Foundation

struct RickAndMortyCharactersRepository: CharactersRepository {
    
    let manager: NetworkRequestManager
    
    func fetchCharacters(for status: Status?, nextPage: URL?) async throws -> CharactersPage {
        let request = NetworkRoute.RickAndMortyRoute.characters(status: status, next: nextPage)
        let response: CharactersPage = try await manager.perform(request: request)
        return response
    }
}
