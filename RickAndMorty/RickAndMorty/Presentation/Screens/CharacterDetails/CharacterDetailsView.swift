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
                
                VStack(spacing: 0) {
                    
                    HStack {
                        Text(viewModel.name)
                            .font(.title)
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Text(viewModel.status.title)
                            .font(.subheadline)
                            .foregroundStyle(Color.black.swiftUIColor)
                            .lineLimit(1)
                            .padding(.horizontal, 12)
                            .padding(.vertical, 4)
                            .background(Color.deepSkyBlue.swiftUIColor)
                            .clipShape(Capsule())
                    }
                    
                    HStack(spacing: 12) {
                        Text(viewModel.species)
                            .foregroundStyle(Color.jacarta.swiftUIColor)
                        Circle()
                            .frame(width: 4, height: 4)
                        Text(viewModel.gender.title)
                            .foregroundStyle(Color.kimberly.swiftUIColor)
                        Spacer()
                    }
                    
                    HStack {
                        Text("Location : ")
                            .lineLimit(1)
                            .fontWeight(.semibold)
                            .foregroundStyle(Color.black.swiftUIColor)
                        Text(viewModel.location)
                            .fontWeight(.medium)
                            .lineLimit(2)
                            .foregroundStyle(Color.jacarta.swiftUIColor)
                        Spacer()
                    }
                    .padding(.top)
                    
                }
                .padding()
            }
            .ignoresSafeArea(edges: .top)
        }
        .overlay(alignment: .topLeading) {
            BackButton()
                .padding(.leading)
        }
    }
}

#Preview {
    CharacterDetailsView(viewModel: RMCharacterDetailsViewModel(name: "Zephyr", image: URL(string: "https://picsum.photos/200"), species: "Elf", status: .alive, gender: .male, location: "Earth"))
}

