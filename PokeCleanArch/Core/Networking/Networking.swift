//
//  Networking.swift
//  PokeCleanArch
//
//  Created by user on 13/05/24.
//

import Foundation

// MARK: - Networking Protocol -
protocol NetworkingProtocol {
    func request<T: Decodable>(_ endpoint: Endpoint) async throws -> T
}

// MARK: - Networking Singleton Class -
public final class Networking {
    private init () {}
    static let shared = Networking()
}

extension Networking: NetworkingProtocol {
    
    // MARK: - Generic Make Request Method -
    func request<T: Decodable>(_ endpoint: Endpoint) async throws -> T {
        let request = try endpoint.urlRequest()
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse else { throw
            NetworkError.responseUnsuccessful
        }
        
        print(httpResponse.statusCode)
        
        switch httpResponse.statusCode {
        case 200...299:
            let responseObject = try JSONDecoder().decode(T.self, from: data)
            print(responseObject)
            return responseObject
        case 400...499:
            throw NetworkError.notFound
        case 500...599:
            throw NetworkError.badRequest
        default:
            throw NetworkError.httpCode(httpResponse.statusCode)
        }
    }
}
