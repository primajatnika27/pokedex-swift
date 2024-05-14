//
//  PokemonSpeciesResponseDataModel.swift
//  PokeCleanArch
//
//  Created by user on 14/05/24.
//

import Foundation

struct PokemonSpeciesResponseDataModel: Codable {
    let flavorTextEntries: [FlavorTextEntry]
    
    enum CodingKeys: String, CodingKey {
        case flavorTextEntries = "flavor_text_entries"
    }
}

// MARK: - FlavorTextEntry
struct FlavorTextEntry: Codable {
    let flavorText: String
    let language, version: Language
    
    enum CodingKeys: String, CodingKey {
        case flavorText = "flavor_text"
        case language, version
    }
}

// MARK: - Language
struct Language: Codable {
    let name: String
    let url: String
}
