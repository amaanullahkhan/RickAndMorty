//
//  CharacterDetailsView.swift
//  RickAndMorty
//
//  Created by Amaan Ullah on 24/10/2024.
//

import SwiftUI

struct CharacterDetailsView: View {
    
    var viewModel: CharacterDetailsViewModel
    
    var body: some View {
        GeometryReader { proxy in
            VStack {
                
                AsyncImage(url: viewModel.image, content: { image in
                    image
                    .resizable()
                }, placeholder: {
                    Color.kimberly.swiftUIColor
                })
                .frame(height: proxy.size.height/2)
                .clipShape(
                    RoundedRectangle(cornerRadius: 50)
                )
                .ignoresSafeArea(edges: .top)
                
                VStack {
                    
                    HStack {
                        Text(viewModel.name)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Text(viewModel.status.title)
                            .foregroundStyle(Color.black.swiftUIColor)
                            .lineLimit(1)
                            .padding()
                            .background(Color.deepSkyBlue.swiftUIColor)
                            .clipShape(Capsule())
                    }
                    
                    HStack(spacing: 12) {
                        Text(viewModel.species)
                            .foregroundStyle(Color.jacarta.swiftUIColor)
                        Circle()
                            .frame(width: 6, height: 6)
                        Text(viewModel.gender.title)
                            .foregroundStyle(Color.kimberly.swiftUIColor)
                        Spacer()
                    }
                    
                    HStack {
                        Text("Location: ")
                            .foregroundStyle(Color.black.swiftUIColor)
                        Text(viewModel.location)
                            .foregroundStyle(Color.jacarta.swiftUIColor)
                        Spacer()
                    }
                    
                }
                .padding()
            }
        }
    }
}


#Preview {
    CharacterDetailsView(viewModel: RMCharacterDetailsViewModel(name: "Zephyr", image: URL(string: "https://picsum.photos/200"), species: "Elf", status: .alive, gender: .male, location: "Earth"))
}

