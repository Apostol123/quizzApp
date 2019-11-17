//
//  QuizThemeModel.swift
//  QuizApp
//
//  Created by user159106 on 11/17/19.
//  Copyright © 2019 user159106. All rights reserved.
//

import Foundation

struct QuizThemeModel : Codable  {
    let Title: String
}

struct QuizzThemsBank : Codable {
    var themes: [QuizThemeModel]
}
