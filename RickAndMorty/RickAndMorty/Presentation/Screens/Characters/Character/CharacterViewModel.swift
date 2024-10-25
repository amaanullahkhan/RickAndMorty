//
//  CharacterViewModel.swift
//  RickAndMorty
//
//  Created by Amaan Ullah on 24/10/2024.
//

import Foundation

protocol CharacterViewModel {
    var name: String { get }
    var image: URL? { get }
    var species: String { get }
    var status: Status { get }
    
    func didTap()
}

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
    
    func didTap() {
        
    }
}
