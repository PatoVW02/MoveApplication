//
//  HomeView.swift
//  App02-TMDB
//
//  Created by Patricio Villarreal Welsh on 23/08/23.
//

import SwiftUI

struct HomeView: View {
    @StateObject var dataModel = DataModel()
    @Binding var selectedView: String?
    @Binding var selectedMovie: Movie?
    @Binding var selectedSerie: Serie?

    var body: some View {
        GeometryReader {geo in
            NavigationStack {
                ScrollView(.horizontal) {
                    LazyHStack {
                        ForEach(dataModel.movies) { movie in
                            Button {
                                selectedView = "movieDetail"
                                selectedMovie = movie
                            } label: {
                                MovieRowView(movie: movie)
                                    .frame(width: geo.size.width * 0.8)
                            }
                            .buttonStyle(PlainButtonStyle())
                            .padding(30)
                        }
                    }
                }
                
                ScrollView(.horizontal) {
                    LazyHStack {
                        ForEach(dataModel.series) { serie in
                            Button {
                                selectedView = "serieDetail"
                                selectedSerie = serie
                            } label: {
                                SerieRowView(serie: serie)
                                    .frame(width: geo.size.width * 0.8)
                            }
                            .buttonStyle(PlainButtonStyle())
                            .padding(30)
                        }
                    }
                }
                .navigationTitle("Movies and Series")
            }
            .onAppear {
                dataModel.fetchGenres()
            }
            Spacer()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(selectedView: .constant("home"), selectedMovie: .constant(Movie.dummy), selectedSerie: .constant(Serie.dummy))
    }
}
