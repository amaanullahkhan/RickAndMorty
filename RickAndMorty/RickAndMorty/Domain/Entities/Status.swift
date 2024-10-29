//
//  Status.swift
//  RickAndMorty
//
//  Created by Amaan Ullah on 28/10/2024.
//

import Foundation

enum Status: String, CaseIterable, Identifiable, Decodable {
    
    case alive = "Alive"
    case dead = "Dead"
    case unknown
    
    var id: String {
        rawValue
    }
    
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
