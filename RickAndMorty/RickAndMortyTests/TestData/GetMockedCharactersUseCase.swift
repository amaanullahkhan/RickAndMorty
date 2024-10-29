//
//  MockedCharactersRepository.swift
//  RickAndMortyTests
//
//  Created by Amaan Ullah on 29/10/2024.
//

import Foundation
@testable import RickAndMorty

struct GetSuccessMockedCharactersUseCase: GetCharactersUseCase {
    func getCharacters(for status: RickAndMorty.Status?, nextPage: URL?) async throws -> CharactersPage {
        try await withCheckedThrowingContinuation { continuation in
            continuation.resume(returning: .dummy)
        }
    }
}

struct GetFailureMockedCharactersUseCase: GetCharactersUseCase {
    func getCharacters(for status: RickAndMorty.Status?, nextPage: URL?) async throws -> CharactersPage {
        try await withCheckedThrowingContinuation { continuation in
            continuation.resume(throwing: CharactersError.somethingWentWrong)
        }
    }
    
    enum CharactersError: Error {
        case somethingWentWrong
    }
}

