# PokeDex App
This application using API from https://pokeapi.co/
Then for UI/UX i'm reference by Figma https://www.figma.com/design/vHtHKX6KBlg8SkRVn92fTw/Pok%C3%A9dex-(Community)?node-id=1017-650&t=LRMA0h5HLAwjzyTr-0

# Architecture
SOLID + Clean Architecture for SwiftUI

# Project Tree
```bash
.
├── Core
│   ├── App
│   │   ├── AppRouter.swift
│   │   └── DI.swift
│   ├── Components
│   │   └── CacheAsyncImage
│   │       └── CacheAsyncImage.swift
│   ├── Networking
│   │   ├── Endpoint.swift
│   │   └── Networking.swift
│   └── Utils
│       └── Color+Extension.swift
├── Features
│   └── PokemonPage
│       ├── Data
│       │   ├── DataSources
│       │   │   ├── PokemonDataSource.swift
│       │   │   └── PokemonEndpoint.swift
│       │   ├── Models
│       │   │   ├── PokemonDetailResponseDataModel.swift
│       │   │   ├── PokemonResponseDataModel.swift
│       │   │   └── PokemonSpeciesResponseDataModel.swift
│       │   └── Repository
│       │       └── PokemonRepository.swift
│       ├── Domain
│       │   ├── Entities
│       │   │   ├── PokemonDetailEntity.swift
│       │   │   ├── PokemonEntity.swift
│       │   │   └── PokemonSpeciesEntity.swift
│       │   ├── Repositories
│       │   │   └── PokemonRepositoryProtocol.swift
│       │   └── UseCases
│       │       ├── GetPokemonDetailUseCase.swift
│       │       ├── GetPokemonListUseCase.swift
│       │       └── GetPokemonSpeciesUseCase.swift
│       └── Presentation
│           ├── View
│           │   ├── PokemonCardView.swift
│           │   ├── PokemonDetailView.swift
│           │   └── PokemonView.swift
│           └── ViewModel
│               └── PokemonViewModel.swift
├── Info.plist
├── PokeCleanArchApp.swift
```
