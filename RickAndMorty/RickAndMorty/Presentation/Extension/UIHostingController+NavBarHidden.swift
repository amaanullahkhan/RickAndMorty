//
//  NavBarHiddenNavigationController.swift
//  RickAndMorty
//
//  Created by Amaan Ullah on 28/10/2024.
//

import Foundation
import SwiftUI

class UIHostingControllerNavBarHidden<Content: View>: UIHostingController<Content> {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
}
