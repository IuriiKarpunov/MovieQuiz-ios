//
//  MovieQuizPresenterTests.swift
//  MovieQuizPresenterTests
//
//  Created by Iurii on 19.06.23.
//

import XCTest
@testable import MovieQuiz

final class MovieQuizViewControllerMock: MovieQuizViewControllerProtocol {
    func show(quiz step: QuizStepViewModel) { }
    func show(result: QuizResultsViewModel) { }
    func showNetworkError(message: String) { }
    func highlightImageBorder(isCorrectAnswer: Bool) { }
    func showLoadingIndicator() { }
    func hideLoadingIndicator() { }
    func enableButtons() { }
    func disableButtons() { }
}

final class MovieQuizPresenterTests: XCTestCase {

    func testPresenterConvertModel() throws {
        let viewControllerMock = MovieQuizViewControllerMock()
        let sut = MovieQuizPresenter(viewController: viewControllerMock)

        let emptyData = Data()
        let question = QuizQuestion(image: emptyData, text: "Question Text", correctAnswer: true)
        let viewModel = sut.convert(model: question)

        XCTAssertNotNil(viewModel.image)
        XCTAssertEqual(viewModel.question, "Question Text")
        XCTAssertEqual(viewModel.questionNumber, "1/10")

    }

}