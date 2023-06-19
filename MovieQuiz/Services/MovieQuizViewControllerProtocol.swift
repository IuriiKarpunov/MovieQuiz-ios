//
//  MovieQuizViewControllerProtocol.swift
//  MovieQuiz
//
//  Created by Iurii on 19.06.23.
//

import Foundation

protocol MovieQuizViewControllerProtocol: AnyObject {
    func show(quiz step: QuizStepViewModel)
    func show(result: QuizResultsViewModel)
    func showNetworkError(message: String)
    
    func highlightImageBorder(isCorrectAnswer: Bool)
    
    func showLoadingIndicator()
    func hideLoadingIndicator()
    
    func enableButtons()
    func disableButtons()
    
} 
