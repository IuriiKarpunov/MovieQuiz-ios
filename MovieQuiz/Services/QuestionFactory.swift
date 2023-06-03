//
//  QuestionFactory.swift
//  MovieQuiz
//
//  Created by Iurii on 15.05.23.
//

import Foundation

class QuestionFactory: QuestionFactoryProtocol {
    
    private let moviesLoader: MoviesLoading
    private weak var delegate: QuestionFactoryDelegate?
    
    init(moviesLoader: MoviesLoading, delegate: QuestionFactoryDelegate) {
        self.delegate = delegate
        self.moviesLoader = moviesLoader
    }
    
    private var movies: [MostPopularMovie] = []
    
    func loadData() {
        moviesLoader.loadMovies { [weak self] result in
            DispatchQueue.main.async {
                guard let self = self else { return }
                switch result {
                case .success(let mostPopularMovies):
                    self.movies = mostPopularMovies.items
                    self.delegate?.didLoadDataFromServer()
                    
                    let errorMessage = mostPopularMovies.errorMessage
                    let items = mostPopularMovies.items
                    
                    if !(errorMessage.isEmpty) && items.isEmpty {
                        self.delegate?.didFailToLoadData(with: errorMessage)
                    }
                case .failure(let error):
                    self.delegate?.didFailToLoadData(with: error.localizedDescription)
                }
            }
        }
    }
    
    func requestNextQuestion() {
        DispatchQueue.global().async { [weak self] in
            guard let self = self else { return }
            let index = (0..<self.movies.count).randomElement() ?? 0
            
            guard let movie = self.movies[safe: index] else { return }
            
            var imageData = Data()
           
           do {
               imageData = try Data(contentsOf: movie.resizedImageURL)
            } catch {
                print("Failed to load image")
                DispatchQueue.main.async {  [weak self] in
                    guard let self = self else { return }
                    self.delegate?.didFailToLoadData(with: error.localizedDescription)
                }
            }
            
            let rating = Float(movie.rating) ?? 0
            
            var ratingRandom = Float(String(format: "%.1f", Float.random(in: 8.0...9.2)))!

            while rating == ratingRandom{
                ratingRandom = Float(String(format: "%.1f", Float.random(in: 8.0...9.2)))!
            }
            
            let text = "Рейтинг этого фильма больше чем \(String(describing: ratingRandom))?"
            let correctAnswer = rating > ratingRandom
            
            let question = QuizQuestion(image: imageData,
                                         text: text,
                                         correctAnswer: correctAnswer)
            
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }
                self.delegate?.didReceiveNextQuestion(question: question)
            }
        }
    }
}
