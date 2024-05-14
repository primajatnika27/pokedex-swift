//
//  PokemonEndpoint.swift
//  PokeCleanArch
//
//  Created by user on 13/05/24.
//

import Foundation

enum PokemonEndpoint: Endpoint {
    case fetchPokemonList
    case fetchPokemonDetail(id: Int)
    case fetchPokemonSpecies(id: Int)
    
    public var path: String {
        switch self {
        case .fetchPokemonList:
            return "/pokemon?offset=0&limit=200"
        case .fetchPokemonDetail(id: let id):
            return "/pokemon/\(id)"
        case .fetchPokemonSpecies(id: let id):
            return "/pokemon-species/\(id)"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .fetchPokemonList:
            return .get
        case .fetchPokemonDetail(id: _):
            return .get
        case .fetchPokemonSpecies(id: _):
            return .get
        }
    }
    
    var headers: HTTPHeaders {
        switch self {
        case .fetchPokemonList:
            return nil
        case .fetchPokemonDetail(id: _):
            return nil
        case .fetchPokemonSpecies(id: _):
            return nil
        }
    }
    
    func body() throws -> Data? {
        switch self {
        case .fetchPokemonList:
            return nil
        case .fetchPokemonDetail(id: _):
            return nil
        case .fetchPokemonSpecies(id: _):
            return nil
        }
    }
    
    
}
