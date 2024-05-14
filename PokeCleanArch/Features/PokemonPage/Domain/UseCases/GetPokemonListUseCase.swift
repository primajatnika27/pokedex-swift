//
//  GetPokemonListUseCase.swift
//  PokeCleanArch
//
//  Created by user on 13/05/24.
//

import Foundation

class GetPokemonListUseCase {
    private let repository: PokemonRepositoryProtocol
    
    init(repository: PokemonRepositoryProtocol) {
        self.repository = repository
    }
    
    func execute() async throws -> [PokemonEntity] {
        try await repository.fetchPokemonList()
    }
}
