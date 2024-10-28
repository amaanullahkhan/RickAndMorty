//
//  Gender.swift
//  RickAndMorty
//
//  Created by Amaan Ullah on 28/10/2024.
//

import Foundation

enum Gender: String, Decodable {
    
    case female = "Female"
    case male = "Male"
    case genderless = "Genderless"
    case unknown
    
    var title: String {
        switch self {
        case .female:
            LocalizedString.female
        case .male:
            LocalizedString.male
        case .genderless:
            LocalizedString.genderless
        case .unknown:
            LocalizedString.unknown
        }
    }
}
