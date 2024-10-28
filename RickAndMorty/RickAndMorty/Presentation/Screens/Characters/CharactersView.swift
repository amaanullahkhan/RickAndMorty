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

class CharactersView<ViewModel: CharactersViewModel>: UIView, UITableViewDataSource, UITableViewDelegate, UIGestureRecognizerDelegate {
    
    @ObservedObject var viewModel: ViewModel
        
    lazy private var tableView = {
        let tView = UITableView()
        tView.delegate = self
        tView.dataSource = self
        tView.separatorStyle = .none
        tView.sectionHeaderTopPadding = 0
        return tView
    }()
    
    private var cancellables = Set<AnyCancellable>()
    
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
    }
    
    @available(*, unavailable, message: "Loading it from a nib is not supported in favor of dependency injection.")
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func viewDidLoad() {
        viewModel.viewDidLoad()
        setupLayouts()
        bindViewModel()
    }
    
    private func setupLayouts() {
        addSubviewWithConstraint(tableView)
    }
    
    private func bindViewModel() {
        viewModel.output = { [unowned self] output in
            switch output {
            case .loaded:
                tableView.reloadData()
            case .loadedNewPage:
                tableView.insertRows(upTo: viewModel.characterViewModels.count)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header: FilterHeaderView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "header")
        header.populate(with: $viewModel.statusFilter)
        return header
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.characterViewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: CharacterViewCell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell.populate(with: viewModel.characterViewModels[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.didSelectCharacterAt(index: indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        viewModel.willDisplayCharacterAt(index: indexPath.row)
    }
    
}
