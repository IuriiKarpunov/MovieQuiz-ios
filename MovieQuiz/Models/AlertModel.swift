//
//  AlertModel.swift
//  MovieQuiz
//
//  Created by Iurii on 18.05.23.
//

import UIKit

struct AlertModel {
    let title: String
    let message: String
    let buttonText: String
    let completion: (() -> Void)
}
