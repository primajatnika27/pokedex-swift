//
//  PokemonRepository.swift
//  PokeCleanArch
//
//  Created by user on 13/05/24.
//

import Foundation

class PokemonRepository: PokemonRepositoryProtocol {
    private let dataSource = PokemonDataSource()
    
    func fetchPokemonList() async throws -> [PokemonEntity] {
        let response = try await dataSource.fetchPokemonList()
        
        guard let results = response.results else { return [] }
        
        let data = results.compactMap { poke in
            return PokemonEntity(with: poke)
        }
        
        return data
    }
    
    func fetchPokemonDetail(id: Int) async throws -> PokemonDetailEntity {
        let response = try await dataSource.fetchPokemonDetail(id: id)
        
        return PokemonDetailEntity(with: response)!
    }
    
    func fetchPokemonSpecies(id: Int) async throws -> PokemonSpeciesEntity {
        let response = try await dataSource.fetchPokemonSpecies(id: id)
        
        return PokemonSpeciesEntity(with: response)!
    }
}
