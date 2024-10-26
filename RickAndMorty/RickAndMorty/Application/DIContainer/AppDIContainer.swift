//
//  AppDIContainer.swift
//  RickAndMorty
//
//  Created by Amaan Ullah on 23/10/2024.
//

import Foundation
import UIKit

@MainActor
class AppDIContainer {
    
    private let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func makeAppFlowCoordinator() -> AppFlowCoordinator {
        AppFlowCoordinator(dependencies: self)
    }
}

extension AppDIContainer: AppFlowCoordinator.Dependencies {
    func makeHomeDIContainer() -> HomeDIContainer {
        HomeDIContainer(window: window)
    }
}
