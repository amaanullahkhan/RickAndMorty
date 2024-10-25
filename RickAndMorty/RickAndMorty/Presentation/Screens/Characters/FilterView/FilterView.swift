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
                    print(selectedStatus)
                    selectedStatus = status == selectedStatus ? nil : status
                } label: {
                    Text(status.title)
                        .foregroundStyle(selectedStatus == status ? Color.white : .black)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 25)
                                .stroke(Color.gray, lineWidth: 1.5)
                                .fill(selectedStatus == status ? Color.black : .white)
                        )
                }

            }
        }
    }
}

#Preview {
    FilterView(selectedStatus: Binding<Status?>(.constant(.dead)))
}
