//
//  HomeDIContainer.swift
//  RickAndMorty
//
//  Created by Amaan Ullah on 23/10/2024.
//

import Foundation
import UIKit

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
    
    func makeCharactersScreen(router: CharactersViewModelRouter) -> CharactersViewController {
        let viewModel = RMCharactersViewModel(router: router)
        let viewController = CharactersViewController(viewModel: viewModel)
        return viewController
    }
}


