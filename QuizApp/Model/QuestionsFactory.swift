//
//  QuestionsFactory.swift
//  QuizApp
//
//  Created by user159106 on 11/7/19.
//  Copyright © 2019 user159106. All rights reserved.
//

import Foundation

class QuestionsFactory {
    
    var questionBank : QuestionsBank!
    
    init() {
        /*
        if let path = Bundle.main.path(forResource: "QuestionsBank", ofType: "plist") {
            if  let plist = NSDictionary(contentsOfFile: path) {
                let questionsData = plist["Questions"] as! [AnyObject]
                
                for question in questionsData {
                    if let text = question["Question"] , let answer = question["Answer"], let explanation = question["Explanation"]{
                        
                        self.questions.append(Question(text: text as! String, correctAnswer: answer as! Bool, answerExplanation: explanation as! String))
                    }
                }
                
                print(plist)
                
            }
 
        }
 */
        do {
            
            if let url = Bundle.main.url(forResource: "QuestionsBank", withExtension: "plist"){
                let data = try Data(contentsOf: url)
                self.questionBank = try PropertyListDecoder().decode(QuestionsBank.self, from: data)
               
            }
            
        }catch {
            print(error)
        }
        
        
    }
    
    func getQuestionAt(index: Int) -> Question? {
        
        if index < self.questionBank.Questions.count {
            return self.questionBank.Questions[index]
        } else {
            return nil
        }
        
    }
    
    func getRandomQuestion () -> Question {
        
        let index = arc4random_uniform(UInt32(self.questionBank.Questions.count))
        return self.questionBank.Questions[Int(index)]
    }
}
