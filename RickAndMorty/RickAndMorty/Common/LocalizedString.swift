//
//  LocalizableString.swift
//  RickAndMorty
//
//  Created by Amaan Ullah on 25/10/2024.
//

import Foundation

private extension String {
    var localised: String {
        NSLocalizedString(self, comment: "")
    }
}

enum LocalizedString {
    
    static let characters = "characters".localised
    static let retry = "retry".localised
    static let somethingWentWrong = "something_went_wrong".localised
    
    static let alive = "alive".localised
    static let dead = "dead".localised
    static let unknown = "unknown".localised
}
