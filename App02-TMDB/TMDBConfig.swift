//
//  TMDBConfig.swift
//  App02-TMDB
//
//  Created by Patricio Villarreal Welsh on 21/08/23.
//

import Foundation

let apiAuth = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI0ZmRjZWNhM2NlYWNjYTM1MDdjN2RiMTZhMGUzYmNhZCIsInN1YiI6IjY0ZTNkNzE3YzNjODkxMDBlMzVlMmE2NiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.tkkYeHAk4VKMleuqeZn4E0puqCn69Og3qZH6TN-KUrM"
let apiKey = "4fdceca3ceacca3507c7db16a0e3bcad"
let headers = [ "Authorization": "Bearer \(apiAuth)", "Accept": "application/json", "Content-Type": "application/json" ]
let tmdbURL = "https://api.themoviedb.org/3/"
let imageURL = "https://image.tmdb.org/t/p/original"
let youtubeURL = "https://youtu.be/"
