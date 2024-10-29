//
//  NetworkData.swift
//  RickAndMorty
//
//  Created by Amaan Ullah on 25/10/2024.
//

import Foundation
import Combine

protocol NetworkRequestManager {
    func perform<T: Decodable>(request requestConvertable: URLRequestConvertable) async throws -> T
}

struct URLSessionNetworkRequestManager: NetworkRequestManager {
    
    private let session: URLSession
    private let jsonDecoder: JSONDecoder
    
    init(session: URLSession = URLSession.shared,
         jsonDecoder: JSONDecoder = JSONDecoder()) {
        self.session = session
        self.jsonDecoder = jsonDecoder
    }
    
    func perform<T: Decodable>(request requestConvertable: URLRequestConvertable) async throws -> T {
        do {
            let (data, response) = try await session.data(for: requestConvertable.asURLRequest())
            guard let httpResponse = response as? HTTPURLResponse,
                  httpResponse.statusCode == 200 else {
                throw NetworkError.somethingWentWrong
            }
            let result = try jsonDecoder.decode(T.self, from: data)
            return result
        } catch {
            throw error
        }
    }
}
