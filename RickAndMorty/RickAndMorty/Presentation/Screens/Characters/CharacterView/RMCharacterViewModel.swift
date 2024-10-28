//
//  RMCharacterViewModel.swift
//  RickAndMorty
//
//  Created by Amaan Ullah on 28/10/2024.
//

import Foundation

struct RMCharacterViewModel: CharacterViewModel {
    
    let name: String
    let image: URL?
    let species: String
    var status: Status
    
    let character: Character
    
    init(character: Character) {
        self.character = character
        self.name = character.name
        self.image = character.image
        self.species = character.species
        self.status = character.status
    }
}
