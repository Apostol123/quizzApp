//
//  QuizzThemeFactory.swift
//  QuizApp
//
//  Created by user159106 on 11/17/19.
//  Copyright © 2019 user159106. All rights reserved.
//

import Foundation


class QuizzThemeFactory {
    var themes : QuizzThemsBank!
    
    init () {
        do {
                   
                   if let url = Bundle.main.url(forResource: "QuizzThemeBank", withExtension: "plist"){
                       let data = try Data(contentsOf: url)
                    self.themes = try PropertyListDecoder().decode(QuizzThemsBank.self, from: data)
                      
                   }
                   
               }catch {
                   print(error)
               }
    }
}

