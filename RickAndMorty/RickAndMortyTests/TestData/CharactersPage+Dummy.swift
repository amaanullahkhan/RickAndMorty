//
//  Characters+DummyCharacters.swift
//  RickAndMortyTests
//
//  Created by Amaan Ullah on 29/10/2024.
//

import Foundation
@testable import RickAndMorty

extension CharactersPage {
    static let dummy: CharactersPage = {
        let characters = (1...20).map {
            Character(name: "Character \($0)", image: nil, species: "Species \($0)", status: .alive, gender: .female, location: .init(name: "Location \($0)"))
        }
        return .init(characters: characters, pageInfo: .init(next: nil))
    }()
}
