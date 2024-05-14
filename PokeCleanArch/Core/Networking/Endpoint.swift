//
//  Endpoint.swift
//  PokeCleanArch
//
//  Created by user on 13/05/24.
//

import Foundation

public enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case patch = "PATCH"
    case delete = "DELETE"
}

public typealias HTTPHeaders = [String: String]?

protocol Endpoint {
    var path: String { get }
    var method: HTTPMethod { get }
    var headers: HTTPHeaders { get }
    func body() throws -> Data?
}

extension Endpoint {
    func urlRequest() throws -> URLRequest {
        guard let url = URL(string: "https://pokeapi.co/api/v2\(path)") else {
            throw NetworkError.invalidRequest
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.allHTTPHeaderFields = headers
        request.httpBody = try body()
        
        return request
    }
}

// MARK: - NetworkError
typealias HTTPCode = Int
enum NetworkError: Swift.Error {
    case notFound
    case badRequest
    case invalidRequest
    case httpCode(HTTPCode)
    case responseUnsuccessful
}

extension NetworkError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .notFound: return "The requested url was not found"
        case .badRequest: return "Bad Request"
        case .invalidRequest: return "Invalid Request"
        case let .httpCode(code): return "Unexpected HTTP code: \(code)"
        case .responseUnsuccessful: return "Response Unsuccessful"
        }
    }
}
