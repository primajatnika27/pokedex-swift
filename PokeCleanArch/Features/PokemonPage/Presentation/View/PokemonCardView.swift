//
//  PokemonCardView.swift
//  PokeCleanArch
//
//  Created by user on 13/05/24.
//

import SwiftUI

struct PokemonCardView: View {
    
    var dataPokemon: PokemonEntity
    
    var body: some View {
        
        ZStack(alignment: .bottom) {
            Rectangle()
                .fill(Color.gray.opacity(0.1))
                .frame(height: 80) // Atur tinggi sesuai kebutuhan
                .cornerRadius(20)
            
            VStack {
                Text(self.dataPokemon.pokeId!)
                    .foregroundColor(Color(hex: "666666"))
                    .font(.subheadline)
                    .padding(.top, 20)
                
                CacheAsyncImage(
                    url: URL(
                        string: self.dataPokemon.image
                    )
                ) { image in
                    image.image?.resizable().scaledToFit()
                }
                
                Text(self.dataPokemon.name)
                    .foregroundColor(Color(hex: "1D1D1D"))
                    .font(.headline)
                    .textCase(.uppercase)
                    .padding(.top, 5)
            }
            .padding(.bottom, 20)
        }
        .frame(height: 200)
        .background(Color.white)
        .cornerRadius(20)
        .shadow(radius: 5)
    }
}

#Preview {
    PokemonCardView(dataPokemon: PokemonEntity(with: PokemonDataModel(name: "Charmander", url: "https://pokeapi.co/api/v2/pokemon/4/"))!)
}
