//
//  GetRickAndMortyCharactersUseCaseTests.swift
//  RickAndMortyTests
//
//  Created by Amaan Ullah on 29/10/2024.
//

import XCTest
@testable import RickAndMorty

final class GetRickAndMortyCharactersUseCaseTests: XCTestCase {
        
    func testRickAndMortyCharactersCountAndNameWhenSuccessfullyFetchedCharacters() async throws {
        
        // Given
        let sut = GetRMCharactersUseCase(repository: SuccessMockedCharactersRepository())
        let expectedCount = 20
        let expectedName = "Character 20"
        var resultCount: Int?
        var resultName: String?
        
        // When
        let charactersPage = try await sut.getCharacters(for: nil, nextPage: nil)
        resultCount = charactersPage.characters.count
        resultName = charactersPage.characters.last?.name
        
        // Then
        XCTAssertEqual(resultCount, expectedCount)
        XCTAssertEqual(resultName, expectedName)
    }
    
    func testRickAndMortyCharactersErrorWhenFailedToFetchCharacters() async {
        
        // Given
        let sut = GetRMCharactersUseCase(repository: FailtureMockedCharactersRepository())
        let expectedError = FailtureMockedCharactersRepository.CharactersError.somethingWentWrong
        var resultError: FailtureMockedCharactersRepository.CharactersError?
        
        // When
        do {
            _ = try await sut.getCharacters(for: nil, nextPage: nil)
        } catch {
            resultError = error as? FailtureMockedCharactersRepository.CharactersError
        }
        
        // Then
        XCTAssertEqual(resultError, expectedError)
    }

}
