//
//  GetPokemonDetailUseCase.swift
//  PokeCleanArch
//
//  Created by user on 14/05/24.
//

import Foundation

class GetPokemonDetailUseCase {
    private let repository: PokemonRepositoryProtocol
    
    init(repository: PokemonRepositoryProtocol) {
        self.repository = repository
    }
    
    func execute(id: Int) async throws -> PokemonDetailEntity {
        try await repository.fetchPokemonDetail(id: id)
    }
}
