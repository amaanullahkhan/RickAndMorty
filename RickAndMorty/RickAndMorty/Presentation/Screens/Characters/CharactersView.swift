//
//  CharactersView.swift
//  RickAndMorty
//
//  Created by Amaan Ullah on 24/10/2024.
//

import Foundation
import UIKit
import SwiftUI

class CharactersView: UIView {
    
    let viewModel: any CharactersViewModel
    
    let cellIdentifier: String = "characterCell"
    
    lazy private var tableView = {
       let tView = UITableView()
        tView.delegate = self
        tView.dataSource = self
        return tView
    }()
    
    init(viewModel: any CharactersViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        self.setupLayouts()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayouts() {
        addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([tableView.topAnchor.constraint(equalTo: topAnchor),
                                     tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
                                     tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
                                     tableView.trailingAnchor.constraint(equalTo: trailingAnchor)])
    }
}

extension CharactersView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.characterViewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell! = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: cellIdentifier)
        }
        let viewModel: CharacterViewModel = viewModel.characterViewModels[indexPath.row]
        cell.contentConfiguration = UIHostingConfiguration {
            CharacterView(viewModel: viewModel)
        }
        cell.selectionStyle = .none
        return cell
    }
}

extension CharactersView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.didSelectCharacterAt(index: indexPath.row)
    }
}
