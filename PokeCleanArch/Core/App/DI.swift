//
//  DI.swift
//  PokeCleanArch
//
//  Created by user on 13/05/24.
//

import Foundation

protocol DIProtocol {
    static func pokemonRepository() -> PokemonRepositoryProtocol
}

enum DI: DIProtocol {
    static func pokemonRepository() -> PokemonRepositoryProtocol {
        return PokemonRepository()
    }
    
}
