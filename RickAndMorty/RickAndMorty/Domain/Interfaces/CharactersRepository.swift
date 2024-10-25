//
//  CharactersRepository.swift
//  RickAndMorty
//
//  Created by Amaan Ullah on 25/10/2024.
//

import Foundation

protocol CharactersRepository {
    func fetchCharacters() async throws -> [Character]
}
