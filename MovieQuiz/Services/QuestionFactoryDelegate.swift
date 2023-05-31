//
//  QuestionFactoryDelegate.swift
//  MovieQuiz
//
//  Created by Iurii on 17.05.23.
//

import Foundation

protocol QuestionFactoryDelegate: AnyObject {
    func didReceiveNextQuestion(question: QuizQuestion?)
    func didLoadDataFromServer()
    func didFailToLoadData(with error: Error)
}
