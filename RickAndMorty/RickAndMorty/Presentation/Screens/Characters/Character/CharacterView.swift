//
//  CharacterView.swift
//  RickAndMorty
//
//  Created by Amaan Ullah on 24/10/2024.
//

import SwiftUI

struct CharacterView: View {
    
    let viewModel: CharacterViewModel
    
    var body: some View {
        HStack(alignment: .top, spacing: 20) {
            AsyncImage(url: viewModel.image) { image in
                image.resizable()
            } placeholder: {
                Color.gray
            }
            .frame(width: 100, height: 100)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            
            VStack {
                Text(viewModel.name)
                    .font(.headline)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .lineLimit(1)
                Text(viewModel.species)
                    .font(.subheadline)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .lineLimit(1)
            }
            .padding(.vertical, 6)

        }
        .padding(25)
        .background(
            RoundedRectangle(cornerRadius: 25)
                .stroke(Color.gray, lineWidth: viewModel.isAlive == nil ? 1.5 : 0)
                .fill(viewModel.isAlive == nil ? Color.clear : viewModel.isAlive! ? Color.red.opacity(0.2) : Color.blue.opacity(0.2))
        )
        
    }
}

struct CharacterViewPreview: PreviewProvider {
    static var previews: some View {
        CharacterView(viewModel: RMCharacterViewModel(name: "Zephyr", image: URL(string: "https://picsum.photos/200"), species: "Elf"))
    }
}
