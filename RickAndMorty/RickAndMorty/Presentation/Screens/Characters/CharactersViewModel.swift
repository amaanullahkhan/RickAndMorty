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
    
    func didSelectCharacterAt(index: Int)
}

protocol CharactersViewModelRouter {
    func showCharacterDetailsScreen(for character: Character)
}

struct RMCharactersViewModel: CharactersViewModel {
    var title: String = "Characters"
    var characterViewModels: [CharacterViewModel] = [RMCharacterViewModel(character: Character(name: "Zephyr", image: URL(string: "https://picsum.photos/200"), species: "Elf", status: .alive, gender: .male, location: "Earth")),
                                                     RMCharacterViewModel(character: Character(name: "Zephyr", image: URL(string: "https://picsum.photos/200"), species: "Elf", status: .dead, gender: .male, location: "Earth")),
                                                     RMCharacterViewModel(character: Character(name: "Zephyr", image: URL(string: "https://picsum.photos/200"), species: "Elf", status: .unknown, gender: .male, location: "Earth"))]
    let router: CharactersViewModelRouter
    
    init(router: CharactersViewModelRouter) {
        self.router = router
    }
    
    func didSelectCharacterAt(index: Int) {
        guard let characterViewModel = characterViewModels[index] as? RMCharacterViewModel else { fatalError("Could not cast as RMCharacterViewModel") }
        router.showCharacterDetailsScreen(for: characterViewModel.character)
    }
}
