//
//  PokemonDetailEntity.swift
//  PokeCleanArch
//
//  Created by user on 14/05/24.
//

import Foundation

// MARK: - PokemonDetailEntity
class PokemonDetailEntity {
    var abilities: [AbilityEntity]
    var baseExperience: Int
    var cries: Cries
    var forms: [Species]
    var height, id: Int
    var isDefault: Bool
    var locationAreaEncounters: String
    var name: String
    var order: Int
    var species: Species
    var stats: [StatEntity]
    var types: [TypeElementEntity]
    var weight: Int

    init?(with pokemonDetailDataModel: PokemonDetailResponseDataModel) {
        self.abilities = pokemonDetailDataModel.abilities.map({ ability in
            return AbilityEntity(with: ability)!
        })
        self.baseExperience = pokemonDetailDataModel.baseExperience
        self.cries = pokemonDetailDataModel.cries
        self.forms = pokemonDetailDataModel.forms
        self.height = pokemonDetailDataModel.height
        self.id = pokemonDetailDataModel.id
        self.isDefault = pokemonDetailDataModel.isDefault
        self.locationAreaEncounters = pokemonDetailDataModel.locationAreaEncounters
        self.name = pokemonDetailDataModel.name
        self.order = pokemonDetailDataModel.order
        self.species = pokemonDetailDataModel.species
        self.stats = pokemonDetailDataModel.stats.map({ stat in
            return StatEntity(with: stat)!
        })
        self.types = pokemonDetailDataModel.types.map({ type in
            return TypeElementEntity(with: type)!
        })
        self.weight = pokemonDetailDataModel.weight
    }
}

// MARK: - Ability
class AbilityEntity {
    let ability: SpeciesEntity
    let isHidden: Bool
    let slot: Int

    init?(with abilities: Ability) {
        self.ability = SpeciesEntity(with: abilities.ability)!
        self.isHidden = abilities.isHidden
        self.slot = abilities.slot
    }
}

// MARK: - Stat
class StatEntity {
    let baseStat, effort: Int
    let stat: SpeciesEntity

    init?(with stats: Stat) {
        self.baseStat = stats.baseStat
        self.effort = stats.effort
        self.stat = SpeciesEntity(with: stats.stat)!
    }
}

// MARK: - Species
class SpeciesEntity {
    let name: String
    let url: String

    init?(with species: Species) {
        
        switch species.name {
        case "hp":
            self.name = "HP"
        case "attack":
            self.name = "ATK"
        case "defense":
            self.name = "DEF"
        case "special-attack":
            self.name = "SATK"
        case "special-defense":
            self.name = "SDEF"
        case "speed":
            self.name = "SPD"
        default:
            self.name = species.name
        }
    
        self.url = species.url
    }
}

// MARK: - TypeElement
class TypeElementEntity {
    let slot: Int
    let type: SpeciesEntity

    init?(with typeElement: TypeElement) {
        self.slot = typeElement.slot
        self.type = SpeciesEntity(with: typeElement.type)!
    }
}


