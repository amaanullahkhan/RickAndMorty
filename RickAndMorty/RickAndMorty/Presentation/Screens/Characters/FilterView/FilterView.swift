//
//  FilterView.swift
//  RickAndMorty
//
//  Created by Amaan Ullah on 25/10/2024.
//

import SwiftUI

struct FilterView: View {
        
    @Binding var selectedStatus: Status?
    
    var body: some View {
        HStack {
            ForEach(Status.allCases) { status in
                Button {
                    selectedStatus = status == selectedStatus ? nil : status
                } label: {
                    makeStatusView(status)
                }
            }
        }
    }
    
    func makeStatusView(_ status: Status) -> some View {
        Text(status.title)
            .font(.subheadline)
            .foregroundStyle(selectedStatus == status ? .white : .black)
            .padding(.horizontal, 10)
            .padding(.vertical, 6)
            .background(
                RoundedRectangle(cornerRadius: 100)
                    .stroke(.blueHaze, lineWidth: 2)
                    .fill(selectedStatus == status ? .black : .white)
            )
    }
}

#Preview {
    FilterView(selectedStatus: Binding<Status?>(.constant(.dead)))
}
