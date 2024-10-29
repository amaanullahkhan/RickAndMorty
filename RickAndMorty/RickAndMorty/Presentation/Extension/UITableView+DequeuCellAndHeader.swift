//
//  UITableView+Deqeue.swift
//  RickAndMorty
//
//  Created by Amaan Ullah on 28/10/2024.
//

import Foundation
import UIKit

extension UITableView {
    
    func dequeueReusableCell<Cell: UITableViewCell>(withIdentifier identifier: String) -> Cell {
        dequeueReusableCell(withIdentifier: identifier) as? Cell ?? Cell(style: .default, reuseIdentifier: identifier)
    }
    
    func dequeueReusableHeaderFooterView<View: UITableViewHeaderFooterView>(withIdentifier identifier: String) -> View {
        dequeueReusableHeaderFooterView(withIdentifier: identifier) as? View ?? View(reuseIdentifier: identifier)
    }
}
