//
//  GetRMCharactersUseCase.swift
//  RickAndMorty
//
//  Created by Amaan Ullah on 25/10/2024.
//

import Foundation

protocol GetCharactersUseCase {
    func getCharacters(for status: Status?, nextPage: URL?) async throws -> CharactersPage
}

struct GetRMCharactersUseCase: GetCharactersUseCase {
    
    let repository: CharactersRepository
    
    func getCharacters(for status: Status?, nextPage: URL?) async throws -> CharactersPage {
        try await repository.fetchCharacters(for: status, nextPage: nextPage)
    }
}
