//
//  HomeFlowCoordinator.swift
//  RickAndMorty
//
//  Created by Amaan Ullah on 23/10/2024.
//

import Foundation
import UIKit
import SwiftUI

class HomeFlowCoordinator {
    
    private let dependencies: Dependencies
    
    lazy private var window: UIWindow = dependencies.makeWindow()
    lazy private var navigationController: UINavigationController = dependencies.makeNavigationController()
    
    init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }
    
    func start() {
        showHomeScreen()
    }
    
    private func showHomeScreen() {
        let homeScreen = dependencies.makeCharactersScreen(router: self)
        navigationController.setViewControllers([homeScreen], animated: false)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
    
    protocol Dependencies {
        func makeWindow() -> UIWindow
        func makeNavigationController() -> UINavigationController
        func makeCharactersScreen(router: CharactersViewModelRouter) -> CharactersViewController
        func makeCharacterDetailsScreen(character: Character) -> UIViewController
    }
    
}

extension HomeFlowCoordinator: CharactersViewModelRouter {
    func showCharacterDetailsScreen(for character: Character) {
        let viewController = dependencies.makeCharacterDetailsScreen(character: character)
        navigationController.pushViewController(viewController, animated: true)
    }
}
