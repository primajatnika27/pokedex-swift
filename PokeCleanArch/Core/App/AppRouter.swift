//
//  AppRouter.swift
//  PokeCleanArch
//
//  Created by user on 13/05/24.
//

import Foundation
import SwiftUI

enum AppRouter {
    static func makePokemonView() -> some View {
        let viewModel = PokemonViewModel()
        let view = PokemonView(viewModel: viewModel)
        
        return view
    }
    
    static func makePokemonDetailView(pokemon: PokemonEntity) -> some View {
        let viewModel = PokemonViewModel()
        
        viewModel.pokemon = pokemon
        let view = PokemonDetailView(viewModel: viewModel)
        
        return view
    }
}
