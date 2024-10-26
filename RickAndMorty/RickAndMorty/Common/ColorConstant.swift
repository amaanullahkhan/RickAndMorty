//
//  ColorConstant.swift
//  RickAndMorty
//
//  Created by Amaan Ullah on 26/10/2024.
//

import Foundation
import UIKit
import SwiftUI

enum RMColor: String {
    
    case black
    case blueHaze
    case jacarta
    case kimberly
    case lavender
    case mistyRose
    case selago
    case white
    
    var uiColor: UIColor {
        return UIColor(named: rawValue)!
    }
    
    var swiftUIColor: Color {
        return Color(rawValue)
    }

}
