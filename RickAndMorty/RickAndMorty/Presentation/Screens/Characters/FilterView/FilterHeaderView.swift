//
//  FilterViewHeader.swift
//  RickAndMorty
//
//  Created by Amaan Ullah on 28/10/2024.
//

import UIKit
import SwiftUI

class FilterHeaderView: UITableViewHeaderFooterView {
    
    func populate(with status: Binding<Status?>) {
        contentConfiguration = UIHostingConfiguration {
            FilterView(selectedStatus: status)
        }
    }
}
