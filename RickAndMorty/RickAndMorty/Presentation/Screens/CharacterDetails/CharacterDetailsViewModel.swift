//
//  CharacterDetailsViewModel.swift
//  RickAndMorty
//
//  Created by Amaan Ullah on 24/10/2024.
//

import Foundation

protocol CharacterDetailsViewModel {
    var name: String { get }
    var image: URL? { get }
    var species: String { get }
    var status: Status { get }
    var gender: Gender { get }
    var location: String { get }
}

struct RMCharacterDetailsViewModel: CharacterDetailsViewModel {
    
    let name: String
    let image: URL?
    let species: String
    let status: Status
    let gender: Gender
    let location: String
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
