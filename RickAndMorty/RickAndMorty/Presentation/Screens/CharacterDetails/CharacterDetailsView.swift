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
                    Color.gray
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
                            .lineLimit(1)
                            .padding()
                            .background(Color.blue)
                            .clipShape(Capsule())
                    }
                    
                    HStack(spacing: 12) {
                        Text(viewModel.species)
                        Circle()
                            .frame(width: 6, height: 6)
                        Text(viewModel.gender.title)
                            .foregroundStyle(.gray)
                        Spacer()
                    }
                    
                    HStack {
                        Text("Location: ")
                        Text(viewModel.location)
                            .foregroundStyle(.gray)
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

