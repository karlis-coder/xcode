//
//  DataManager.swift
//  MovieLists
//
//  Created by Karlis Butins on 04/02/2021.
//

import Foundation


class DataManager{
    static let shared = DataManager()
    var title = [
        "Judas",
        "Lone Wolf McQuade",
        "Nobody",
        "Outland",
        "Saturn 3",
        "Star Wars: The Force Awakens",
        "Step Brothers",
        "Valley Girl",
        "The 6th Day",
        "Skillet",
        "Tylor the Creator",
        "YG",
    ]
    var year = [
        "2021",
        "1983",
        "2021",
        "1981",
        "1980",
        "2015",
        "2008",
        "1983",
        "2000",
        "Victory",
        "IGOR",
        "Stop Snitching",
    ]
    var poster = [
        "Judas - 2021",
        "Lonewolfmcquade - 1983",
        "Nobody - 2021",
        "Outland - 1981",
        "Saturn3 - 1980",
        "StarWars - 2015",
        "Stepbrothers - 2008",
        "Valleygirl - 1983",
        "Sixthday - 2000",
        "Skillet - Victory",
        "Tylor the Creator - IGOR",
        "YG - Stop Snitching",
    ]
    
    var favoriteMovies = Set<Int>()
    func favoriteFilteredMovies() -> [Movie] {
        let movies = Movie.createMovie()
        var favorites = [Movie]()
        favoriteMovies.forEach {
            favorites.append(movies[$0])
        }
        
        return favorites
    }
}


