//
//  RMcharactersViewModel.swift
//  RickAndMorty
//
//  Created by Amaan Ullah on 28/10/2024.
//

import Foundation
import Combine

class RMCharactersViewModel: CharactersViewModel {
    
    @Published
    var statusFilter: Status?
    var title: String = LocalizedString.characters
    var nextPage: URL?
    var characterViewModels: [RMCharacterViewModel] = []
    var output: (CharactersViewModelOutput) -> Void = { _ in }
    
    private let useCase: GetCharactersUseCase
    private let router: CharactersViewModelRouter
    private var cancellables = Set<AnyCancellable>()
    
    init(router: CharactersViewModelRouter, useCase: GetCharactersUseCase) {
        self.router = router
        self.useCase = useCase
    }
    
    func didSelectCharacterAt(index: Int) {
        router.showCharacterDetailsScreen(for: characterViewModels[index].character)
    }
    
    func willDisplayCharacterAt(index: Int) {
        guard index == characterViewModels.count - 5 else {
            return
        }
        getCharactersNextPage()
    }
    
    func viewDidLoad() {
        getCharacters(status: statusFilter)
        subscribeToFilterChange()
    }
    
    private func subscribeToFilterChange() {
        $statusFilter.dropFirst()
            .sink { [unowned self] status in
                getCharacters(status: status)
            }.store(in: &cancellables)
    }
    
    private func getCharacters(status: Status?) {
        Task {
            do {
                let charactersPage = try await useCase.getCharacters(for: status, nextPage: nil)
                nextPage = charactersPage.pageInfo.next
                characterViewModels = charactersPage.characters.map { RMCharacterViewModel(character: $0) }
                output(.loaded)
                
            } catch {
                print(error)
            }
        }
    }
    
    private func getCharactersNextPage() {
        guard let nextPage else { return }
        Task {
            do {
                let charactersPage = try await useCase.getCharacters(for: statusFilter, nextPage: nextPage)
                self.nextPage = charactersPage.pageInfo.next
                characterViewModels += charactersPage.characters.map { RMCharacterViewModel(character: $0) }
                output(.loadedNewPage)
            } catch {
                print(error)
            }
        }
    }
}
