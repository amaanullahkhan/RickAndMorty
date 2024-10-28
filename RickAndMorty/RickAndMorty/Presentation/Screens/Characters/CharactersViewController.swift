//
//  CharactersViewController.swift
//  RickAndMorty
//
//  Created by Amaan Ullah on 24/10/2024.
//

import Foundation
import UIKit

class CharactersViewController<ViewModel: CharactersViewModel>: UIViewController {
    
    let viewModel: ViewModel
    
    lazy private var charactersView: CharactersView = {
       CharactersView(viewModel: viewModel)
    }()
    
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable,
      message: "Loading it from a nib is not supported in favor of dependency injection."
    )
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = charactersView
        title = viewModel.title
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        charactersView.viewDidLoad()
    }

}




