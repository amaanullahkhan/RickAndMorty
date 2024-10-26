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
                Color.kimberly.swiftUIColor
            }
            .frame(width: 100, height: 100)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            
            VStack {
                Text(viewModel.name)
                    .foregroundStyle(Color.black.swiftUIColor)
                    .font(.headline)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .lineLimit(1)
                Text(viewModel.species)
                    .foregroundStyle(Color.jacarta.swiftUIColor)
                    .font(.subheadline)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .lineLimit(1)
            }
            .padding(.vertical, 6)

        }
        .padding(25)
        .background(
            RoundedRectangle(cornerRadius: 25)
                .stroke(Color.selago.swiftUIColor, lineWidth: getStatusStrokeLine())
                .fill(getStatusColor())
        )
        
    }
    
    private func getStatusStrokeLine() -> CGFloat {
        switch viewModel.status {
        case .alive, .dead:
            return 0
        case .unknown:
            return 1.5
        }
    }
    
    private func getStatusColor() -> some ShapeStyle {
        switch viewModel.status {
        case .alive:
            return Color.lavender.swiftUIColor
        case .dead:
            return Color.mistyRose.swiftUIColor
        case .unknown:
            return Color.clear.swiftUIColor
        }
    }
}

//struct CharacterViewPreview: PreviewProvider {
//    static var previews: some View {
//        CharacterView(viewModel: RMCharacterViewModel(character: Character(name: "Zephyr", image: URL(string: "https://picsum.photos/200"), species: "Elf", status: .unknown, gender: .male, location: "Earth")))
//    }
//}
