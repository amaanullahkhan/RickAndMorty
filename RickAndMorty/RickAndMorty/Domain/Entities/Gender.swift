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
}
