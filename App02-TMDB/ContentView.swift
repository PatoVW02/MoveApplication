//
//  ContentView.swift
//  App02-TMDB
//
//  Created by Patricio Villarreal Welsh on 21/08/23.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedView: String?
    @State private var selectedMovie: Movie?
    @State private var selectedSerie: Serie?
    
    var body: some View {
        NavigationStack {
            if selectedView == "home" || selectedView == nil {
                HomeView(selectedView: $selectedView, selectedMovie: $selectedMovie, selectedSerie: $selectedSerie)
            } else if selectedView == "search" {
                SearchView()
            } else if selectedView == "favorites" {
                FavoriteView()
            } else if selectedView == "movieDetail" {
                MovieDetailView(movie: selectedMovie ?? Movie.dummy)
            } else if selectedView == "serieDetail" {
                SerieDetailView(serie: selectedSerie ?? Serie.dummy)
            }
            
            MenubarView(selectedView: $selectedView)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
