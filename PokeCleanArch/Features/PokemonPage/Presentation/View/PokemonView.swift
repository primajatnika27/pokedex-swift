//
//  PokemonView.swift
//  PokeCleanArch
//
//  Created by user on 13/05/24.
//

import SwiftUI

struct PokemonView<Model>: View where Model: PokemonViewModelProtocol {
    @StateObject private var viewModel: Model
    @State private var searchText: String = ""
    
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]

    
    init(viewModel: Model) {
        _viewModel = StateObject(wrappedValue: viewModel)
        //Use this if NavigationBarTitle is with displayMode = .inline
                UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.red]
    }
    var body: some View {
        ScrollView {
            Section {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(viewModel.pokemonList, id: \.pokeId) { pokemon in
                        NavigationLink(destination: AppRouter.makePokemonDetailView(pokemon: pokemon)) {
                            PokemonCardView(dataPokemon: pokemon)
                        }
                    }
                }
                .padding(.all, 20)
            }
            .background(Color.white)
            .overlay(
                Rectangle()
                    .stroke(Color.gray, lineWidth: 4)
                    .blur(radius: 3)
            )
            .cornerRadius(20)
            .padding(.all, 10)
        }
        .background(Color(hex: "DC0A2D"))
        .listStyle(.insetGrouped)
        .searchable(text: $searchText, placement: .toolbar)
        .toolbar {
            ToolbarItem(placement: .navigation) {
                Image("Title").resizable().scaledToFit()
            }
        }
        .toolbarBackground(Color(hex: "DC0A2D"), for: .navigationBar)
        .onAppear {
            viewModel.fetchPokemonList()
        }
    }
}

#Preview {
    PokemonView(viewModel: PokemonViewModel())
}
