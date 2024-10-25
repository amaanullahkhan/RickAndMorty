//
//  Character.swift
//  RickAndMorty
//
//  Created by Amaan Ullah on 25/10/2024.
//

import Foundation

struct Character {
    let name: String
    let image: URL?
    let species: String
    var status: Status
    var gender: Gender
    var location: String
}

enum Status {
    
    case alive
    case dead
    case unknown
    
    var title: String {
        switch self {
        case .alive:
            return "Alive"
        case .dead:
            return "Dead"
        case .unknown:
            return "Unknown"
        }
    }
}


enum Gender {
    
    case female
    case male
    case genderless
    case unknown
    
    var title: String {
        switch self {
        case .female:
            return "Female"
        case .male:
            return "Male"
        case .genderless:
            return "Genderless"
        case .unknown:
            return "Unknown"
        }
    }
}
