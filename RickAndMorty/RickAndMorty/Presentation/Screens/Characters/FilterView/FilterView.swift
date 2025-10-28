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
            .padding(.horizontal, 10)
            .padding(.vertical, 6)
            .glassEffect(.regular.tint(selectedStatus == status ? .black : .white))
            .glassEffect(.regular.interactive())
    }
}

#Preview {
    FilterView(selectedStatus: Binding<Status?>(.constant(.dead)))
}
