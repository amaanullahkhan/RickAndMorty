//
//  CharactersViewModel.swift
//  RickAndMorty
//
//  Created by Amaan Ullah on 24/10/2024.
//

import Foundation

protocol CharactersViewModel {
    var title: String { get }
    var characterViewModels: [CharacterViewModel] { get }
}

struct RMCharactersViewModel: CharactersViewModel {
    var title: String = "Characters"
    var characterViewModels: [CharacterViewModel] = [RMCharacterViewModel(name: "Zephyr", image: URL(string: "https://picsum.photos/200"), species: "Elf"),
                                                     RMCharacterViewModel(name: "Zephyr", image: URL(string: "https://picsum.photos/200"), species: "Elf", isAlive: true),
                                                     RMCharacterViewModel(name: "Zephyr", image: URL(string: "https://picsum.photos/200"), species: "Elf", isAlive: false)]
}
