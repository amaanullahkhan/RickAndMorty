//
//  CharacterViewCell.swift
//  RickAndMorty
//
//  Created by Amaan Ullah on 28/10/2024.
//

import UIKit
import SwiftUI

class CharacterViewCell: UITableViewCell {
    
    func populate(with viewModel: CharacterViewModel) {
        selectionStyle = .none
        contentConfiguration = UIHostingConfiguration {
            CharacterView(viewModel: viewModel)
        }
        .margins(.vertical, 4)
    }

}
