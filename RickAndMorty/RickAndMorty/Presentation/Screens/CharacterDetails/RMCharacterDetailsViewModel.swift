//
//  DefaultCharacterDetailsViewModel.swift
//  RickAndMorty
//
//  Created by Amaan Ullah on 28/10/2024.
//

import Foundation

struct RMCharacterDetailsViewModel: CharacterDetailsViewModel {
    
    let name: String
    let image: URL?
    let species: String
    let status: Status
    let gender: Gender
    let location: String
    let locationLabel: String = "Location: "
}

extension RMCharacterDetailsViewModel {
    
    init(character: Character) {
        name = character.name
        image = character.image
        species = character.species
        status = character.status
        gender = character.gender
        location = character.location.name
    }
}
