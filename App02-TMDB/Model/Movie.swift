//
//  Movie.swift
//  App02-TMDB
//
//  Created by Patricio Villarreal Welsh on 21/08/23.
//

import Foundation

struct Movie: Identifiable {
    var id: Int
    var title: String
    var poster_path: String
    var overview: String
    var release_date: String
    var vote_average: Double
    var genres: [String]
}

extension Movie {
    static var dummy = Movie(
        id: 976573,
        title: "Elemental",
        poster_path: "/6oH378KUfCEitzJkm07r97L0RsZ.jpg",
        overview: "In a city where fire, water, land and air residents live together, a fiery young woman and a go-with-the-flow guy will discover something elemental: how much they have in common.",
        release_date: "2023-06-14",
        vote_average: 7.7,
        genres: ["Family", "Action", "Comedy"]
    )
}

