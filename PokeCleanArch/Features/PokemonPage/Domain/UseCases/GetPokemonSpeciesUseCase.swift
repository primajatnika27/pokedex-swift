//
//  GetPokemonSpeciesUseCase.swift
//  PokeCleanArch
//
//  Created by user on 14/05/24.
//

import Foundation

class GetPokemonSpeciesUseCase {
    private let repository: PokemonRepositoryProtocol
    
    init(repository: PokemonRepositoryProtocol) {
        self.repository = repository
    }
    
    func execute(id: Int) async throws -> PokemonSpeciesEntity {
        return try await repository.fetchPokemonSpecies(id: id)
    }
}
