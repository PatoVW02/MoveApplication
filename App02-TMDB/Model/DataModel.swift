//
//  MovieModel.swift
//  App02-TMDB
//
//  Created by Patricio Villarreal Welsh on 21/08/23.
//

import Foundation
import SwiftUI
import Alamofire
import SwiftyJSON

class DataModel: ObservableObject {
    @Published var genres = [Genre]()
    @Published var movies = [Movie]()
    @Published var series = [Serie]()
    
    init() {
        
    }
    
    func fetchGenres() {
        genres.removeAll()
        
        AF.request("\(tmdbURL)/genre/movie/list?language=en", method: .get, encoding: URLEncoding.default, headers: HTTPHeaders(headers)).responseData { data in
            let json = try! JSON(data: data.data!)
            for genre in json["genres"] {
                let g = Genre(
                    id: genre.1["id"].intValue,
                    name: genre.1["name"].stringValue
                )

                self.genres.append(g)
            }
            
            self.fetchMovies()
            self.fetchSeries()
        }
    }
    
    func fetchMovies() {
        movies.removeAll()
        
        AF.request("\(tmdbURL)/movie/now_playing?language=en-US&page=1", method: .get, encoding: URLEncoding.default, headers: HTTPHeaders(headers)).responseData {
            data in
            let json = try! JSON(data: data.data!)
            for m in json["results"] {
                var movieGenres = [String]()
                for g in m.1["genres"] {
                    if let genreName = self.genres.first(where: {$0.id == g.1.intValue}) {
                        movieGenres.append(genreName.name)
                    }
                }
                
                let movie = Movie(
                    id: m.1["id"].intValue,
                    title: m.1["title"].stringValue,
                    poster_path: m.1["poster_path"].stringValue,
                    overview: m.1["overview"].stringValue,
                    release_date: m.1["release_date"].stringValue,
                    vote_average: m.1["vote_average"].doubleValue,
                    genres: movieGenres
                )
                
                self.movies.append(movie)
            }
        }
    }
    
    func fetchSeries() {
        series.removeAll()
        
        AF.request("\(tmdbURL)/tv/on_the_air?language=en-US&page=1", method: .get, encoding: URLEncoding.default, headers: HTTPHeaders(headers)).responseData {
            data in
            let json = try! JSON(data: data.data!)
            for s in json["results"] {
                var serieGenres = [String]()
                for g in s.1["genres"] {
                    if let genreName = self.genres.first(where: {$0.id == g.1.intValue}) {
                        serieGenres.append(genreName.name)
                    }
                }
                
                let serie = Serie(
                    id: s.1["id"].intValue,
                    backdrop_path: s.1["backdrop_path"].stringValue,
                    first_air_date: s.1["first_air_date"].stringValue,
                    name: s.1["name"].stringValue,
                    origin_country: [s.1["origin_country"][0].stringValue],
                    genres: serieGenres,
                    original_language: s.1["original_language"].stringValue,
                    original_name: s.1["original_name"].stringValue,
                    overview: s.1["overview"].stringValue,
                    popularity: s.1["popularity"].doubleValue,
                    poster_path: s.1["poster_path"].stringValue,
                    vote_average: s.1["vote_average"].doubleValue,
                    vote_count: s.1["vote_count"].intValue
                )
                
                self.series.append(serie)
            }
        
        }
    }
}
