//
//  StatisticService.swift
//  MovieQuiz
//
//  Created by Iurii on 21.05.23.
//

import Foundation

//protocol StatisticService {
//    func store(correct count: Int, total amount: Int)
//    var totalAccuracy: Double { get }
//    var gamesCount: Int { get }
//    var bestGame: GameRecord { get }
//}
//final class StatisticServiceImplementation: StatisticService {
//    
//    private let userDefaults = UserDefaults.standard
//    private enum Keys: String {
//        case correct, total, bestGame, gamesCount
//    }
//    
//    func store(correct count: Int, total amount: Int) {
//        print("1")
//    }
//    
//    var totalAccuracy: Double {
//        return self.totalAccuracy
//    }
//    
//    var gamesCount: Int {
//        return self.gamesCount
//    }
//    
//    var bestGame: GameRecord {
//        get {
//            guard let data = userDefaults.data(forKey: Keys.bestGame.rawValue),
//                let record = try? JSONDecoder().decode(GameRecord.self, from: data) else {
//                return .init(correct: 0, total: 0, date: Date())
//            }
//            return record
//        }
//        
//        set {
//            guard let data = try? JSONEncoder().encode(newValue) else {
//                print("Невозможно сохранить результат")
//                return
//            }
//            userDefaults.set(data, forKey: Keys.bestGame.rawValue)
//        }
//    }
//    
//}

