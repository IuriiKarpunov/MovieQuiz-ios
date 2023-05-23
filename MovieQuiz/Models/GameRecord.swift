//
//  GameRecord.swift
//  MovieQuiz
//
//  Created by Iurii on 21.05.23.
//

import Foundation

struct GameRecord: Codable {
    let correct: Int
    let total: Int
    let date: Date
}
