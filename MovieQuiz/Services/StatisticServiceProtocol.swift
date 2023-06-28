//
//  StatisticServiceProtocol.swift
//  MovieQuiz
//
//  Created by Iurii on 24.05.23.
//

import Foundation


protocol StatisticService {
    var totalAccuracy: Double { get }
    var gamesCount: Int { get }
    var bestGame: GameRecord { get }
    func store(correct count: Int, total amount: Int)
}
