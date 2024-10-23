//
//  AppFlowCoordinator.swift
//  RickAndMorty
//
//  Created by Amaan Ullah on 23/10/2024.
//

import Foundation

class AppFlowCoordinator {
    
    private let dependencies: Dependencies
    
    init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }
    
    func start() {
        let homeDIContainer = dependencies.makeHomeDIContainer()
        let homeFlow =  homeDIContainer.makeHomeFlowCoordinator()
        homeFlow.start()
    }
    
    protocol Dependencies {
        func makeHomeDIContainer() -> HomeDIContainer
    }
}
