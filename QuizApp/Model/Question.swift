//
//  Pregunta.swift
//  QuizApp
//
//  Created by user159106 on 11/7/19.
//  Copyright © 2019 user159106. All rights reserved.
//

import Foundation

class Question : CustomStringConvertible, Codable {
    
    let questionText : String
    let answer : Bool
    let answerExplanation: String
    
    enum CodingKeys: String, CodingKey {
        case questionText = "Question"
        case answer = "Answer"
        case answerExplanation = "Explanation"
    }
    
    var description : String {
        let respuesta = (answer ? "Verdadero" : "Falso")
        return """
                Pregunta:
                    - \(questionText)
                    - Respuesta : \(respuesta)
                    - Explicación : \(answerExplanation)
                """
    }
    
    init(text: String, correctAnswer:Bool, answerExplanation:String) {
        self.questionText = text
        self.answer = correctAnswer
        self.answerExplanation = answerExplanation
    }
    
}

struct QuestionsBank : Codable {
    var Questions : [Question]
    
}


