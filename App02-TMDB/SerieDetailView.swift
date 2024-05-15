//
//  MovieDetailView.swift
//  App02-TMDB
//
//  Created by Patricio Villarreal Welsh on 23/08/23.
//

import SwiftUI
import Kingfisher

struct SerieDetailView: View {
    var serie: Serie
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .top) {
                KFImage(URL(string: "\(imageURL)\(serie.poster_path)"))
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .clipped()

                VStack(spacing: 16) {
                    RoundedRectangle(cornerRadius: 25)
                        .foregroundColor(Color.black.opacity(0.7))
                        .overlay(
                            Text(serie.name)
                                .font(.title)
                                .foregroundColor(Color.white)
                                .padding()
                        )
                        .padding([.horizontal, .top])

                    RoundedRectangle(cornerRadius: 25)
                        .foregroundColor(Color.black.opacity(0.7))
                        .overlay(
                            VStack(alignment: .leading, spacing: 8) {
                                Text(serie.overview)
                                    .foregroundColor(Color.white)
                                Text(serie.first_air_date)
                                    .foregroundColor(Color.white)
                                Text("\(serie.vote_average)")
                                    .foregroundColor(Color.white)
                                Text("\(serie.genres.joined(separator: ", "))")
                                    .foregroundColor(Color.white)
                            }
                            .padding()
                        )
                        .padding([.horizontal, .bottom])
                }
            }
        }
    }
}

struct SerieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        SerieDetailView(serie: Serie.dummy)
    }
}
