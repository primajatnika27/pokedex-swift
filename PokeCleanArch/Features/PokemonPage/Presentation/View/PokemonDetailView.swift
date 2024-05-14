//
//  PokemonDetailView.swift
//  PokeCleanArch
//
//  Created by user on 13/05/24.
//

import SwiftUI

struct PokemonDetailView<Model>: View where Model: PokemonViewModelProtocol {
    @StateObject private var viewModel: Model
    
    init(viewModel: Model) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        VStack {
            if (viewModel.isLoading || viewModel.pokemonDetail == nil) {
                ProgressView()
            } else {
                VStack(alignment: .trailing) {
                    Image("pokeball")
                        .padding(.trailing, 20)
                    
                    ZStack(alignment: .top) {
                    
                        Section {
                            ScrollView {
                                VStack(alignment: .center, spacing: 20) {
                                    HStack {
                                        ForEach(viewModel.pokemonDetail!.types, id: \.slot) { type in
                                            Text(type.type.name)
                                                .padding(.horizontal, 12)
                                                .padding(.vertical, 5)
                                                .background(Color.colorForType("\(type.type.name)"))
                                                .foregroundColor(.white)
                                                .clipShape(Capsule())
                                        }
                                    }
                                    .font(.headline)
                                    .padding(.top, 50)
                                    .padding(.bottom, 10)
                                    
                                    Text("About")
                                        .font(.title2)
                                        .bold()
                                        .foregroundColor(viewModel.pokemonDetail != nil ? Color.colorForType(viewModel.pokemonDetail!.types.first!.type.name) : Color(hex: "74CB48"))
                                    
                                    HStack(spacing: 30) {
                                        VStack(alignment: .center) {
                                            HStack {
                                                Image(systemName: "scalemass")
                                                    .font(.title2)
                                                
                                                Text("\(viewModel.pokemonDetail!.weight) kg")
                                            }
                                            
                                            Spacer()
                                        
                                            Text("Weight")
                                                .font(.caption)
                                                .fontWeight(.light)
                                        }
                                        Divider()
                                        VStack {
                                            HStack {
                                                Image(systemName: "arrow.up.and.down")
                                                    .font(.title2)
                                                
                                                Text("\(viewModel.pokemonDetail!.height) m")
                                            }
                                            
                                            Spacer()
                                            
                                            Text("Height")
                                                .font(.caption)
                                                .fontWeight(.light)
                                        }
                                        Divider()
                                        VStack {
                                            ForEach(viewModel.pokemonDetail!.abilities, id: \.slot) { ability in
                                                Text(ability.ability.name)
                                                    .font(.caption)
                                                    .multilineTextAlignment(.leading)
                                            }
                                            
                                            Spacer()
                                            
                                            Text("Abilities")
                                                .font(.caption)
                                                .fontWeight(.light)
                                        }
                                    }
                                    .padding()
                                    .font(.subheadline)
                                    
                                    Text("\(viewModel.pokemonSpecies?.desc ?? "")")
                                        .font(.footnote)
                                        .lineSpacing(2)
                                        .padding(.horizontal)
                                    
                                    VStack(alignment: .center) {
                                        Text("Base Stats")
                                            .font(.title2)
                                            .bold()
                                            .foregroundColor(viewModel.pokemonDetail != nil ? Color.colorForType(viewModel.pokemonDetail!.types.first!.type.name) : Color(hex: "74CB48"))
                                        
                                        ForEach(viewModel.pokemonDetail!.stats, id: \.baseStat) { stat in
                                            StatView(statName: stat.stat.name, value: stat.baseStat, pokeType: viewModel.pokemonDetail!.types.first!.type.name)
                                        }
                                    }
                                    .padding()
                                }
                            }
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(Color.white)
                        .overlay(
                            Rectangle()
                                .stroke(Color.gray, lineWidth: 2)
                                .blur(radius: 3)
                        )
                        .cornerRadius(20)
                        .padding(.all, 5)
                        
                        CacheAsyncImage(
                            url: URL(
                                string: viewModel.pokemon!.image
                            )
                        ) { image in
                            image.image?.resizable().scaledToFit().frame(width: 250, height: 250)
                        }.offset(x: 1, y: -200)
                    }
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(viewModel.pokemonDetail != nil ? Color.colorForType(viewModel.pokemonDetail!.types.first!.type.name) : Color.gray.opacity(0.1))
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            viewModel.fetchPokemonDetail(id: viewModel.pokemon!.id!)
            viewModel.fetchPokemonSpecies(id: viewModel.pokemon!.id!)
        }
    }
}

struct StatView: View {
    var statName: String
    var value: Int
    var pokeType: String
    
    var body: some View {
        HStack {
            Text(statName)
                .frame(width: 50)
                .fontWeight(.bold)
                .foregroundColor(Color.colorForType(pokeType))
            
            Divider()
            
            ProgressView(value: Double(value), total: 100)
                .progressViewStyle(LinearProgressViewStyle(tint: Color.colorForType(pokeType)))
                .scaleEffect(x: 1, y: 2, anchor: .center)
            
            Text("\(value)")
                .font(.caption)
        }
        .padding(.vertical, 4)
    }
}

#Preview {
    PokemonDetailView(viewModel: PokemonViewModel())
}
