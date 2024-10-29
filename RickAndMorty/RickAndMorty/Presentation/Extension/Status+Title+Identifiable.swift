//
//  Status+Title+ID.swift
//  RickAndMorty
//
//  Created by Amaan Ullah on 29/10/2024.
//

import Foundation

extension Status {
    
    var title: String {
        switch self {
        case .alive:
            LocalizedString.alive
        case .dead:
            LocalizedString.dead
        case .unknown:
            LocalizedString.unknown
        }
    }
}

extension Status: Identifiable {
    var id: String {
        rawValue
    }
}
