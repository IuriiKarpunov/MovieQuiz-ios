//
//  AlertPresenter.swift
//  MovieQuiz
//
//  Created by Iurii on 17.05.23.
//

import UIKit

class AlertPresenter {
    private var questionFactory: QuestionFactoryProtocol?
    
    func show(result: AlertModel) {
        let alert = UIAlertController(title: result.title, message: result.text, preferredStyle: .alert)
        let action = UIAlertAction(title: result.buttonText, style: .default) { [weak self] _ in
            guard let self = self else { return }
            
            self.currentQuestionIndex = 0
            self.correctAnswers = 0
            self.imageView.layer.borderWidth = 0
            
            questionFactory?.requestNextQuestion()
        }
        
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
    }
}

