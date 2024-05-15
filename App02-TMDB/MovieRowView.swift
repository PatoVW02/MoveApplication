//
//  MovieRowView.swift
//  App02-TMDB
//
//  Created by Patricio Villarreal Welsh on 21/08/23.
//

import SwiftUI
import Kingfisher

struct MovieRowView: View {
    var movie: Movie
    
    var body: some View {
        VStack {
            HStack {
                Text(movie.title)
                    .font(.title)
            }
            
            KFImage(URL(string: "\(imageURL)\(movie.poster_path)"))
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .overlay(
                    VStack {
                        Spacer()
                        HStack {
                            VoteAverageView(voteAverage: movie.vote_average)
                            Spacer()
                        }
                    }
                )
        }
        }
}

struct MovieRowView_Preview: PreviewProvider {
    static var previews: some View {
        MovieRowView(movie: Movie.dummy)
    }
}
