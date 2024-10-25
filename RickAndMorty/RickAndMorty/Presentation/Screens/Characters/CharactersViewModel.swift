//
//  CharactersViewModel.swift
//  RickAndMorty
//
//  Created by Amaan Ullah on 24/10/2024.
//

import Foundation

protocol CharactersViewModel {
    
    associatedtype ChildViewModel: CharacterViewModel
    
    var title: String { get }
    var characterViewModels: [ChildViewModel] { get }
    
    func didSelectCharacterAt(index: Int)
}

protocol CharactersViewModelRouter {
    func showCharacterDetailsScreen(for character: Character)
}

struct RMCharactersViewModel: CharactersViewModel {
    
    var title: String = "Characters"
    var characterViewModels: [RMCharacterViewModel] = [RMCharacterViewModel(character: Character(name: "Zephyr", image: URL(string: "https://picsum.photos/200"), species: "Elf", status: .alive, gender: .male, location: "Earth")),
                                                     RMCharacterViewModel(character: Character(name: "Zephyr", image: URL(string: "https://picsum.photos/200"), species: "Elf", status: .dead, gender: .male, location: "Earth")),
                                                     RMCharacterViewModel(character: Character(name: "Zephyr", image: URL(string: "https://picsum.photos/200"), species: "Elf", status: .unknown, gender: .male, location: "Earth"))]
    let router: CharactersViewModelRouter
    
    init(router: CharactersViewModelRouter) {
        self.router = router
    }
    
    func didSelectCharacterAt(index: Int) {
        router.showCharacterDetailsScreen(for: characterViewModels[index].character)
    }
}
