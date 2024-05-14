//
//  PokeCleanArchApp.swift
//  PokeCleanArch
//
//  Created by user on 13/05/24.
//

import SwiftUI

@main
struct PokeCleanArchApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                AppRouter.makePokemonView()
            }.tint(.white)
        }
    }
}
