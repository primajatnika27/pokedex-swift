//
//  PokemonViewModel.swift
//  PokeCleanArch
//
//  Created by user on 13/05/24.
//

import Foundation

protocol PokemonViewModelProtocol: ObservableObject {
    var pokemon: PokemonEntity? { get }
    var isLoading: Bool { get }
    var pokemonList: [PokemonEntity] { get }
    var pokemonDetail: PokemonDetailEntity? { get }
    var pokemonSpecies: PokemonSpeciesEntity? { get }
    func fetchPokemonList()
    func fetchPokemonDetail(id: Int)
    func fetchPokemonSpecies(id: Int)
}

class PokemonViewModel: PokemonViewModelProtocol {
    var pokemon: PokemonEntity?
    
    @Published var isLoading = false
    @Published var pokemonList: [PokemonEntity] = []
    
    @Published var pokemonDetail: PokemonDetailEntity?
    @Published var pokemonSpecies: PokemonSpeciesEntity?
    
    private let useCaseListPoke = GetPokemonListUseCase(repository: DI.pokemonRepository())
    private let useCaseDetailPoke = GetPokemonDetailUseCase(repository: DI.pokemonRepository())
    private let useCaseSpeciesPoke = GetPokemonSpeciesUseCase(repository: DI.pokemonRepository())
    
    func fetchPokemonList() {
        isLoading = true
        Task {
            do {
                let pokemonList = try await useCaseListPoke.execute()
                DispatchQueue.main.async {
                    self.pokemonList = pokemonList
                }
            } catch {
                print("An error occurred: \(error)")
            }
            
            DispatchQueue.main.async {
                self.isLoading = false
            }
        }
    }
    
    func fetchPokemonDetail(id: Int) {
        DispatchQueue.main.async { [self] in
            isLoading = true
        }
        Task {
            do {
                let pokemonDetail = try await useCaseDetailPoke.execute(id: id)
                DispatchQueue.main.async {
                    self.pokemonDetail = pokemonDetail
                    print(pokemonDetail)
                }
            } catch {
                print("An error occurred: \(error)")
            }
            
            DispatchQueue.main.async {
                self.isLoading = false
            }
        }
    }
    
    func fetchPokemonSpecies(id: Int) {
        DispatchQueue.main.async { [self] in
            isLoading = true
        }
        Task {
            do {
                let pokemonSpecies = try await useCaseSpeciesPoke.execute(id: id)
                DispatchQueue.main.async {
                    self.pokemonSpecies = pokemonSpecies
                }
            } catch {
                print("An error occurred: \(error)")
            }
            
            DispatchQueue.main.async {
                self.isLoading = false
            }
        }
    }
}
