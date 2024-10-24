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
    var isAlive: Bool? { get }
}

struct RMCharacterViewModel: CharacterViewModel {
    let name: String
    let image: URL?
    let species: String
    var isAlive: Bool?
}
