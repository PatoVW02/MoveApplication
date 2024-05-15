//
//  SerieRowView.swift
//  App02-TMDB
//
//  Created by Patricio Villarreal Welsh on 21/08/23.
//

import SwiftUI
import Kingfisher

struct SerieRowView: View {
    var serie: Serie
    
    var body: some View {
        VStack {
            HStack {
                Text(serie.name)
                    .font(.title)
            }
            
            KFImage(URL(string: "\(imageURL)\(serie.poster_path)"))
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .overlay(
                    VStack {
                        Spacer()
                        HStack {
                            VoteAverageView(voteAverage: serie.vote_average)
                            Spacer()
                        }
                    }
                )
        }
    }
}

struct SerieRowView_Previews: PreviewProvider {
    static var previews: some View {
        SerieRowView(serie: Serie.dummy)
    }
}
