//
//  Serie.swift
//  App02-TMDB
//
//  Created by Patricio Villarreal Welsh on 21/08/23.
//

import Foundation

struct Serie: Identifiable {
    var id: Int
    var backdrop_path: String
    var first_air_date: String
    var name: String
    var origin_country: [String]
    var genres: [String]
    var original_language: String
    var original_name: String
    var overview: String
    var popularity: Double
    var poster_path: String
    var vote_average: Double
    var vote_count: Int
}

extension Serie {
    static var dummy = Serie(
        id: 1,
        backdrop_path: "/jWXrQstj7p3Wl5MfYWY6IHqRpDb.jpg",
        first_air_date: "1952-12-26",
        name: "Tagesschau",
        origin_country: ["DE"],
        genres: ["News"],
        original_language: "de",
        original_name: "de",
        overview: "German daily news program, the oldest still existing program on German television.",
        popularity: 4708.625,
        poster_path: "/7dFZJ2ZJJdcmkp05B9NWlqTJ5tq.jpg",
        vote_average: 7.5,
        vote_count: 123
    )
}
