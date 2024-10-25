//
//  CharactersViewModel.swift
//  RickAndMorty
//
//  Created by Amaan Ullah on 24/10/2024.
//

import Foundation

protocol CharactersViewModel: ObservableObject {
    
    associatedtype ChildViewModel: CharacterViewModel
    
    var title: String { get }
    var characterViewModels: [ChildViewModel] { get }
    var characterViewModelsPublisher: Published<[ChildViewModel]>.Publisher { get }
    
    func viewDidLoad()
    func viewWillAppear()
    
    func didSelectCharacterAt(index: Int)
}

protocol CharactersViewModelRouter {
    func showCharacterDetailsScreen(for character: Character)
}

class RMCharactersViewModel: CharactersViewModel {
    
    var title: String = "Characters"
    
    @Published
    var characterViewModels: [RMCharacterViewModel] = []
    var characterViewModelsPublisher: Published<[ChildViewModel]>.Publisher { $characterViewModels }
    
    let useCase: GetCharactersUseCase
    let router: CharactersViewModelRouter
    
    init(router: CharactersViewModelRouter, useCase: GetCharactersUseCase) {
        self.router = router
        self.useCase = useCase
    }
    
    func didSelectCharacterAt(index: Int) {
        router.showCharacterDetailsScreen(for: characterViewModels[index].character)
    }
    
    func viewDidLoad() {
        Task { @MainActor in
            do {
                let characters = try await useCase.getCharacters()
                characterViewModels = characters.map { RMCharacterViewModel(character: $0) }
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    func viewWillAppear() {
        
    }
}
