//
//  Characters.swift
//  RickAndMorty
//
//  Created by Amaan Ullah on 26/10/2024.
//

import Foundation

struct CharactersPage: Decodable {
    
    let characters: [Character]
    let pageInfo: Info
    
    struct Info: Decodable {
        let next: URL?
    }
}
