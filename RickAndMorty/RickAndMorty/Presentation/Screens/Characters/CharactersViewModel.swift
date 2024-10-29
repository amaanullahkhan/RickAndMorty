//
//  CharactersViewModel.swift
//  RickAndMorty
//
//  Created by Amaan Ullah on 24/10/2024.
//

import Foundation
import Combine

@MainActor
protocol CharactersViewModel: ObservableObject {
    
    associatedtype ChildViewModel: CharacterViewModel
    
    var title: String { get }
    var statusFilter: Status? { get set }
    var characterViewModels: [ChildViewModel] { get }
    var output: (CharactersViewModelOutput) -> Void { get set }
    
    func viewDidLoad()
    func didSelectCharacterAt(index: Int)
    func willDisplayCharacterAt(index: Int)

}

enum CharactersViewModelOutput {
    case loaded
    case loadedNewPage
}

protocol CharactersViewModelRouter {
    func showCharacterDetailsScreen(for character: Character)
}
