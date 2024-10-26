//
//  HomeDIContainer.swift
//  RickAndMorty
//
//  Created by Amaan Ullah on 23/10/2024.
//

import Foundation
import UIKit
import SwiftUI

@MainActor
class HomeDIContainer {
    
    private let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func makeHomeFlowCoordinator() -> HomeFlowCoordinator {
        HomeFlowCoordinator(dependencies: self)
    }
}

extension HomeDIContainer: HomeFlowCoordinator.Dependencies {
    
    func makeWindow() -> UIWindow {
        window
    }
    
    func makeNavigationController() -> UINavigationController {
        UINavigationController()
    }
    
    func makeCharactersScreen(router: CharactersViewModelRouter) -> CharactersViewController<RMCharactersViewModel> {
        let repository = RickAndMortyCharactersRepository(manager: URLSessionNetworkRequestManager())
        let useCase = GetRMCharactersUseCase(repository: repository)
        let viewModel = RMCharactersViewModel(router: router, useCase: useCase)
        let viewController = CharactersViewController(viewModel: viewModel)
        return viewController
    }
    
    func makeCharacterDetailsScreen(character: Character) -> UIViewController {
        let viewModel = RMCharacterDetailsViewModel(character: character)
        let view = CharacterDetailsView(viewModel: viewModel)
        let viewController = UIHostingController(rootView: view)
        return viewController
    }
}


