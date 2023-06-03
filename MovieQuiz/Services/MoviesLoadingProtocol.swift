//
//  MoviesLoadingProtocol.swift
//  MovieQuiz
//
//  Created by Iurii on 29.05.23.
//

import Foundation

protocol MoviesLoading {
    func loadMovies(handler: @escaping (Result<MostPopularMovies, Error>) -> Void)
}
