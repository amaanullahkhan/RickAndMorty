//
//  RickAndMortyCharactersViewModelTests.swift
//  RickAndMortyTests
//
//  Created by Amaan Ullah on 29/10/2024.
//

import XCTest
@testable import RickAndMorty

final class RickAndMortyCharactersViewModelTests: XCTestCase {
    
    @MainActor
    func testRickAndMortyCharactersCountAndNameWhenSuccessfullyFetchedCharacters() {
        
        // Given
        let sut = RMCharactersViewModel(router: self, useCase: GetSuccessMockedCharactersUseCase())
        let expectation = expectation(description: "download characters")
        let expectedCount = 20
        let expectedName = "Character 20"
        var resultCount: Int?
        var resultName: String?
        
        // When
        sut.viewDidLoad()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            resultCount = sut.characterViewModels.count
            resultName = sut.characterViewModels.last?.name
            expectation.fulfill()
        }
        waitForExpectations(timeout: 1)
        
        // Then
        XCTAssertEqual(resultCount, expectedCount)
        XCTAssertEqual(resultName, expectedName)
    }
    
    @MainActor
    func testRickAndMortyCharactersCountAndNameWhenFailedToFetchCharacters() {
        
        // Given
        let sut = RMCharactersViewModel(router: self, useCase: GetFailureMockedCharactersUseCase())
        let expectation = expectation(description: "download characters")
        let expectedCount = 0
        let expectedName: String? = nil
        var resultCount: Int?
        var resultName: String?
        
        // When
        sut.viewDidLoad()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            resultCount = sut.characterViewModels.count
            resultName = sut.characterViewModels.last?.name
            expectation.fulfill()
        }
        waitForExpectations(timeout: 1)
        
        // Then
        XCTAssertEqual(resultCount, expectedCount)
        XCTAssertEqual(resultName, expectedName)
    }
}

extension RickAndMortyCharactersViewModelTests: CharactersViewModelRouter {
    func showCharacterDetailsScreen(for character: RickAndMorty.Character) {
        
    }
}
