//
//  HomeFlowCoordinator.swift
//  RickAndMorty
//
//  Created by Amaan Ullah on 23/10/2024.
//

import Foundation
import UIKit

class HomeFlowCoordinator {
    
    private let dependencies: Dependencies
    
    init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }
    
    func start() {
        showHomeScreen()
    }
    
    private func showHomeScreen() {
        let window = dependencies.makeWindow()
        let navigationController = dependencies.makeNavigationController()
        let homeScreen = dependencies.makeHomeScreen()
        navigationController.setViewControllers([homeScreen], animated: false)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
    
    protocol Dependencies {
        func makeWindow() -> UIWindow
        func makeNavigationController() -> UINavigationController
        func makeHomeScreen() -> UIViewController
    }
    
}
