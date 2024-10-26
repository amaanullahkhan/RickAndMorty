//
//  ColorConstant.swift
//  RickAndMorty
//
//  Created by Amaan Ullah on 26/10/2024.
//

import Foundation
import UIKit
import SwiftUI

enum Color: String {
    
    case black
    case blueHaze
    case clear
    case deepSkyBlue
    case jacarta
    case kimberly
    case lavender
    case mistyRose
    case selago
    case white
    
    var uiColor: UIColor {
        return UIColor(named: rawValue)!
    }
    
    var swiftUIColor: SwiftUI.Color {
        return SwiftUI.Color(rawValue)
    }

}
