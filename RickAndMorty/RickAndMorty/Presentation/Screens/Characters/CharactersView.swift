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
    
    @ObservedObject var viewModel: ViewModel
        
    lazy private var tableView = {
       let tView = UITableView()
        tView.delegate = self
        tView.dataSource = self
        tView.separatorStyle = .none
        return tView
    }()
    
    private var cancellables = Set<AnyCancellable>()
    
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        self.setup()
        self.setupLayouts()
        self.bindViewModel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {

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
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        var header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "header")
        if header == nil {
            header = UITableViewHeaderFooterView(reuseIdentifier: "header")
        }
        header?.contentConfiguration = UIHostingConfiguration {
            FilterView(selectedStatus: $viewModel.statusFilter)
        }
        return header
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.characterViewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell! = tableView.dequeueReusableCell(withIdentifier: "cell")
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
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
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        viewModel.willDisplayCharacterAt(index: indexPath.row)
    }
}
