//
//  Character.swift
//  RickAndMorty
//
//  Created by Amaan Ullah on 25/10/2024.
//

import Foundation

struct Character: Decodable {
    
    let name: String
    let image: URL?
    let species: String
    var status: Status
    var gender: Gender
    var location: Location
}

struct Location: Decodable {
    let name: String
}           
