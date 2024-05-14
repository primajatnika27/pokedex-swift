//
//  PokemonRepositoryProtocol.swift
//  PokeCleanArch
//
//  Created by user on 13/05/24.
//

import Foundation

protocol PokemonRepositoryProtocol {
    func fetchPokemonList() async throws -> [PokemonEntity]
    func fetchPokemonDetail(id: Int) async throws -> PokemonDetailEntity
    func fetchPokemonSpecies(id: Int) async throws -> PokemonSpeciesEntity
}
