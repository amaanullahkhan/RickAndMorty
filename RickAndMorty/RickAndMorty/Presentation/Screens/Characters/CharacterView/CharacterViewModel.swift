//
//  CharacterViewModel.swift
//  RickAndMorty
//
//  Created by Amaan Ullah on 24/10/2024.
//

import Foundation

protocol CharacterViewModel {
    
    var name: String { get }
    var image: URL? { get }
    var species: String { get }
    var status: Status { get }
    
}
