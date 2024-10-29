//
//  CharactersPage+CodingKeys.swift
//  RickAndMorty
//
//  Created by Amaan Ullah on 29/10/2024.
//

import Foundation

extension CharactersPage {
    enum CodingKeys: String, CodingKey {
        case characters = "results"
        case pageInfo = "info"
    }
}
