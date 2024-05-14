//
//  PokemonDataSource.swift
//  PokeCleanArch
//
//  Created by user on 13/05/24.
//

import Foundation

class PokemonDataSource {
    func fetchPokemonList() async throws -> PokemonResponseDataModel {
        let endpoint = PokemonEndpoint.fetchPokemonList
        return try await Networking.shared.request(endpoint)
    }
    
    func fetchPokemonDetail(id: Int) async throws -> PokemonDetailResponseDataModel {
        let endpoint = PokemonEndpoint.fetchPokemonDetail(id: id)
        return try await Networking.shared.request(endpoint)
    }
    
    func fetchPokemonSpecies(id: Int) async throws -> PokemonSpeciesResponseDataModel {
        let endpoint = PokemonEndpoint.fetchPokemonSpecies(id: id)
        return try await Networking.shared.request(endpoint)
    }
}
