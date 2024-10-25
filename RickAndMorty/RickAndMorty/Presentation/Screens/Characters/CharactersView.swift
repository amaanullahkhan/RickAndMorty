//
//  CharactersView.swift
//  RickAndMorty
//
//  Created by Amaan Ullah on 24/10/2024.
//

import Foundation
import UIKit
import SwiftUI
import Combine

class CharactersView<ViewModel: CharactersViewModel>: UIView, UITableViewDataSource, UITableViewDelegate {
    
    let viewModel: ViewModel
    
    let cellIdentifier: String = "characterCell"
    
    lazy private var tableView = {
       let tView = UITableView()
        tView.delegate = self
        tView.dataSource = self
        return tView
    }()
    
    private var cancellables = Set<AnyCancellable>()
    
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        self.setupLayouts()
        self.bindViewModel()
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
    
    private func bindViewModel() {
        viewModel.characterViewModelsPublisher
            .receive(on: RunLoop.main)
            .sink { [unowned tableView] _ in
                tableView.reloadData()
        }
        .store(in: &cancellables)
    }
    
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.didSelectCharacterAt(index: indexPath.row)
    }
}
