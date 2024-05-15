//
//  MovieDetailView.swift
//  App02-TMDB
//
//  Created by Patricio Villarreal Welsh on 21/08/23.
//

import SwiftUI
import Kingfisher
import CoreData

struct MovieDetailView: View {
    var movie: Movie
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .top) {
                KFImage(URL(string: "\(imageURL)\(movie.poster_path)"))
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .clipped()

                VStack(spacing: 16) {
                    RoundedRectangle(cornerRadius: 25)
                        .foregroundColor(Color.black.opacity(0.7))
                        .overlay(
                            Text(movie.title)
                                .font(.title)
                                .foregroundColor(Color.white)
                                .bold()
                                .padding()
                        )
                        .padding([.horizontal, .top])

                    RoundedRectangle(cornerRadius: 25)
                        .foregroundColor(Color.black.opacity(0.7))
                        .overlay(
                            VStack(alignment: .leading, spacing: 8) {
                                VStack {
                                    HStack {
                                        Text("Overview")
                                            .font(.title2)
                                            .bold()
                                            .foregroundColor(Color.white)
                                        Spacer()
                                    }
                                    Text(movie.overview)
                                        .foregroundColor(Color.white)
                                }
                                .padding(.bottom, 20)
                                
                                HStack {
                                    Text("Release Date:")
                                        .foregroundColor(Color.white)
                                        .bold()
                                    Text(movie.release_date)
                                        .foregroundColor(Color.white)
                                }
                                
                                HStack {
                                    Text("Vote Average:")
                                        .bold()
                                        .foregroundColor(Color.white)
                                    Text("\(movie.vote_average, specifier: "%.01f")")
                                        .foregroundColor(Color.white)
                                }
                                
                                HStack {
                                    Text("Genres:")
                                        .foregroundColor(Color.white)
                                        .bold()
                                    Text(movie.genres.joined(separator: ", "))
                                        .foregroundColor(Color.white)
                                }
                            }
                            .padding()
                        )
                        .padding([.horizontal, .bottom])
                    
                    Button {
                        print("test")
                    } label: {
                        Image(systemName: "star.fill")
                            .foregroundColor(Color.yellow)
                            .font(.title)
                            .padding()
                    }
                }
            }
        }
    }
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView(movie: Movie.dummy)
    }
}
