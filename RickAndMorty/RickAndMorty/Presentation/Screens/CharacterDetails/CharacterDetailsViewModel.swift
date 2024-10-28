//
//  CharacterDetailsViewModel.swift
//  RickAndMorty
//
//  Created by Amaan Ullah on 24/10/2024.
//

import Foundation

protocol CharacterDetailsViewModel {
    
    var name: String { get }
    var image: URL? { get }
    var species: String { get }
    var status: Status { get }
    var gender: Gender { get }
    var location: String { get }
    var locationLabel: String { get }
    
}
