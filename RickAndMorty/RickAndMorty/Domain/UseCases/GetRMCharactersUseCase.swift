//
//  GetRMCharactersUseCase.swift
//  RickAndMorty
//
//  Created by Amaan Ullah on 25/10/2024.
//

import Foundation

protocol GetCharactersUseCase {
    func getCharacters() async throws -> [Character]
}

struct GetRMCharactersUseCase: GetCharactersUseCase {
    
    let repository: CharactersRepository
    
    func getCharacters() async throws -> [Character] {
        try await repository.fetchCharacters()
    }
}
