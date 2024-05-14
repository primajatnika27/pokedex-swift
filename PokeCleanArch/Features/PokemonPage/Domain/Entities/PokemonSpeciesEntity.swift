//
//  PokemonSpeciesEntity.swift
//  PokeCleanArch
//
//  Created by user on 14/05/24.
//

import Foundation

class PokemonSpeciesEntity {
    var desc: String
    
    init?(with pokemonSpeciesDataModel: PokemonSpeciesResponseDataModel) {
        let stringWithoutNewlines = pokemonSpeciesDataModel.flavorTextEntries.first?.flavorText.replacingOccurrences(of: "\n", with: " ")
        self.desc = stringWithoutNewlines ?? ""
    }
}
