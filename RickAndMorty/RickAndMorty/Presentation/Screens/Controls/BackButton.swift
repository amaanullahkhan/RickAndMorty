//
//  BackButton.swift
//  RickAndMorty
//
//  Created by Amaan Ullah on 27/10/2024.
//

import Foundation
import SwiftUI

struct BackButton: View {
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        Button(action: {
            dismiss()
        }, label: {
            Image(systemName: "arrow.backward.circle.fill")
                .resizable()
                .tint(.white)
                .frame(width: 40, height: 40)
                .shadow(radius: 10)
        })
    }
}
