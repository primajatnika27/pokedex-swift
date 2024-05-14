//
//  PokemonResponseDataModel.swift
//  PokeCleanArch
//
//  Created by user on 13/05/24.
//

import Foundation

struct PokemonResponseDataModel: Codable {
    let count: Int
        let next: String
        let previous: String?
        let results: [PokemonDataModel]?
}

struct PokemonDataModel: Codable {
    let name: String
    let url: String
}
