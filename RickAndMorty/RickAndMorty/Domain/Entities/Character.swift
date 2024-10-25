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

enum Status: String, Decodable {
    
    case alive = "Alive"
    case dead = "Dead"
    case unknown
    
    var title: String {
        rawValue
    }
}


enum Gender: String, Decodable {
    
    case female = "Female"
    case male = "Male"
    case genderless = "Genderless"
    case unknown
    
    var title: String {
        rawValue
    }
}
