//
//  Gender+Title.swift
//  RickAndMorty
//
//  Created by Amaan Ullah on 29/10/2024.
//

import Foundation

extension Gender {
    
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
