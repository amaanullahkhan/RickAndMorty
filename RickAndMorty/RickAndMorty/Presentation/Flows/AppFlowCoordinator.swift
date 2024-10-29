//
//  AppFlowCoordinator.swift
//  RickAndMorty
//
//  Created by Amaan Ullah on 23/10/2024.
//

import UIKit

@MainActor
class AppFlowCoordinator {
    
    private let dependencies: Dependencies
    
    init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }
    
    func start() {
        let homeDIContainer = dependencies.makeHomeDIContainer()
        let homeFlow =  homeDIContainer.makeHomeFlowCoordinator()
        setAppearance()
        homeFlow.start()
    }
    
    private func setAppearance() {
        
        let navBarAppearance = UINavigationBar.appearance()
        navBarAppearance.tintColor = Color.black.uiColor
        navBarAppearance.shadowImage = UIImage()
        navBarAppearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: Color.black.uiColor]
        navBarAppearance.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: Color.black.uiColor]
        navBarAppearance.prefersLargeTitles = true
    }
    
    protocol Dependencies {
        func makeHomeDIContainer() -> HomeDIContainer
    }
}
