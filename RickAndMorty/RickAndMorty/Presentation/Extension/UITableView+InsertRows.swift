//
//  UITableView+InsertRows.swift
//  RickAndMorty
//
//  Created by Amaan Ullah on 28/10/2024.
//

import UIKit

extension UITableView {
    
    func insertRows(upTo: Int, inSection section: Int = 0, animation: UITableView.RowAnimation = .automatic) {
        let currentTopIndex = numberOfRows(inSection: section)
        guard upTo > currentTopIndex else {
            return
        }
        let indexPaths = (currentTopIndex..<upTo).map { IndexPath(row: $0, section: section) }
        insertRows(at: indexPaths, with: animation)
    }
}
