//
//  CharactersViewModel.swift
//  RickAndMorty
//
//  Created by Amaan Ullah on 24/10/2024.
//

import Foundation
import Combine

protocol CharactersViewModel: ObservableObject {
    
    associatedtype ChildViewModel: CharacterViewModel
    
    var title: String { get }
    var statusFilter: Status? { get set }
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
    var statusFilter: Status? = .alive
    
    @Published
    var characterViewModels: [RMCharacterViewModel] = []
    var characterViewModelsPublisher: Published<[ChildViewModel]>.Publisher { $characterViewModels }
    
    let useCase: GetCharactersUseCase
    let router: CharactersViewModelRouter
    private var cancellables = Set<AnyCancellable>()
    
    init(router: CharactersViewModelRouter, useCase: GetCharactersUseCase) {
        self.router = router
        self.useCase = useCase
        
    }
    
    func didSelectCharacterAt(index: Int) {
        router.showCharacterDetailsScreen(for: characterViewModels[index].character)
    }
    
    func viewDidLoad() {
        getCharacters(status: statusFilter)
        subscribeToFilterChange()
    }
    
    func viewWillAppear() {
        
    }
    
    private func subscribeToFilterChange() {
        $statusFilter.dropFirst()
            .sink { [unowned self] status in
                getCharacters(status: status)
            }.store(in: &cancellables)
    }
    
    private func getCharacters(status: Status?) {
        Task { @MainActor in
            do {
                let characters = try await useCase.getCharacters(for: status)
                characterViewModels = characters.map { RMCharacterViewModel(character: $0) }
            } catch {
                print(error)
            }
        }
    }
}
