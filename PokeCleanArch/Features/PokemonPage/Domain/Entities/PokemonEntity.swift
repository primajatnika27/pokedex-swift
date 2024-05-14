//
//  PokemonEntity.swift
//  PokeCleanArch
//
//  Created by user on 13/05/24.
//

import Foundation

class PokemonEntity {
    var id: Int?
    var pokeId: String?
    var name: String
    var url: String
    var image: String
    
    init?(with pokemonDataModel: PokemonDataModel) {
        guard let urls = URL(string: pokemonDataModel.url) else {
            return nil
        }
        
        let path = urls.path
        let pathComponents = path.components(separatedBy: "/")
        
        self.id = pathComponents.count >= 5 ? Int(pathComponents[4]) : nil
        self.name = pokemonDataModel.name
        self.url = pokemonDataModel.url
        self.pokeId = pathComponents.count >= 5 ? "#0" + pathComponents[4] : nil
        self.image = "https://img.pokemondb.net/sprites/home/normal/" + pokemonDataModel.name + ".png"
    }
}
