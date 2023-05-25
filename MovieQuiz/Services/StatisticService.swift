//
//  StatisticService.swift
//  MovieQuiz
//
//  Created by Iurii on 21.05.23.
//

import UIKit

//struct GameRecord: Codable, Comparable {
//    let correct: Int
//    let total: Int
//    let date: Date
//    
//    static func < (lhs: GameRecord, rhs: GameRecord) -> Bool {
//        return lhs.correct < rhs.correct
//    }
//}

//protocol StatisticService {
//    func store(correct count: Int, total amount: Int)
//    var totalAccuracy: Double { get }
//    var gamesCount: Int { get }
//    var bestGame: GameRecord { get }
//}

final class StatisticServiceImplementation: StatisticService {
    
    
    
    private let userDefaults = UserDefaults.standard
    private enum Keys: String {
        case correct, total, bestGame, gamesCount
    }
    
    var correct: Int {
            get {
                userDefaults.integer(forKey: Keys.correct.rawValue)
            }
            
            set {
                userDefaults.set(newValue, forKey: Keys.correct.rawValue)
            }
        }
    
    var total: Int {
        get {
            userDefaults.integer(forKey: Keys.total.rawValue)
        }
        
        set {
            userDefaults.set(newValue, forKey: Keys.total.rawValue)
        }
    }
    
    var totalAccuracy: Double  {
        get {
            userDefaults.double(forKey: Keys.total.rawValue)
        } set {
            userDefaults.set(newValue, forKey: Keys.total.rawValue)
        }
    }
    
    var gamesCount: Int {
        get {
            userDefaults.integer(forKey: Keys.gamesCount.rawValue)
        } set {
            userDefaults.set(newValue, forKey: Keys.gamesCount.rawValue)
        }
    }
    
    var bestGame: GameRecord {
        get {
            guard let data = userDefaults.data(forKey: Keys.bestGame.rawValue),
                let record = try? JSONDecoder().decode(GameRecord.self, from: data) else {
                return .init(correct: 0, total: 0, date: Date())
            }
            return record
        } set {
            guard let data = try? JSONEncoder().encode(newValue) else {
                print("Невозможно сохранить результат")
                return
            }
            userDefaults.set(data, forKey: Keys.bestGame.rawValue)
        }
    }
    
    func store(correct count: Int, total amount: Int) {
        gamesCount += 1
        correct += count
        total += amount
        totalAccuracy = Double(count / amount)
        
    }
    

}

