//
//  Status.swift
//  RickAndMorty
//
//  Created by Amaan Ullah on 28/10/2024.
//

import Foundation

enum Status: String, CaseIterable, Decodable {
    
    case alive = "Alive"
    case dead = "Dead"
    case unknown
    
}
