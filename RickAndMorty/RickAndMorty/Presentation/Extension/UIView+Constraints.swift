//
//  UIView+Constraints.swift
//  RickAndMorty
//
//  Created by Amaan Ullah on 28/10/2024.
//

import UIKit

extension UIView {
    
    func addSubviewWithConstraint(_ view: UIView) {
        addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([view.topAnchor.constraint(equalTo: topAnchor),
                                     view.bottomAnchor.constraint(equalTo: bottomAnchor),
                                     view.leadingAnchor.constraint(equalTo: leadingAnchor),
                                     view.trailingAnchor.constraint(equalTo: trailingAnchor)])
    }
}
