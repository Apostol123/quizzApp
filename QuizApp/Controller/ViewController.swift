//
//  ViewController.swift
//  QuizApp
//
//  Created by user159106 on 10/30/19.
//  Copyright © 2019 user159106. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var labelQuestion: UILabel!
    
    @IBOutlet weak var labelQuestionNumber: UILabel!
    
    @IBOutlet weak var labelScore: UILabel!
    
    
    var currentScore = 0
    var currentQuestionId = 0
    var correctQuestionAnswered = 0
    var currentQuestion : Question!
    let factory = QuestionsFactory.init()
    
    @IBOutlet weak var progressBar: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.startGame()
       
       
    }
    
    func askNextQuestion() {
        if let newQuestion = factory.getQuestionAt(index: self.currentQuestionId) {
            self.currentQuestion = newQuestion
            self.labelQuestion.text = self.currentQuestion.questionText
            self.currentQuestionId += 1
        } else {
            //Game over
            self.gameOver()
        }
    }
    
    func gameOver() {
        // dr llama cuando no hay mas preguntas
        let alert = UIAlertController(title: "Fin de la partida", message: "Has acertado \(correctQuestionAnswered) preguntas  prueba otra vez ", preferredStyle: .alert)
        let okAction  = UIAlertAction(title: "OK", style: .default) { (_) in
            self.dismiss(animated: true) {
                self.startGame()
            }
        }
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    func startGame() {
       
        self.currentScore = 0
        self.currentQuestionId = 0
        self.correctQuestionAnswered = 0
        self.factory.questionBank.Questions.shuffle()
         askNextQuestion()
        self.updateUIElements()
    }
    
    func updateUIElements() {
        self.labelScore.text = "Puntuación: \(self.currentScore)"
        self.labelQuestionNumber.text = "\(self.currentQuestionId)/ \(self.factory.questionBank.Questions.count)"
           let screenTotalWidth = self.view.frame.size.width
        for constraints in self.progressBar.constraints {
            if constraints.identifier == "barWidth" {

                constraints.constant = (screenTotalWidth / CGFloat(self.factory.questionBank.Questions.count))*CGFloat (self.currentQuestionId)
            }
        }
        
     
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
        var isCorrect : Bool
        if sender.tag == 1 {
            isCorrect = true
            // el usuario ha clicado el boton true
            isCorrect = (self.currentQuestion.answer == true)
        } else {
            isCorrect = (self.currentQuestion.answer == false)
            // el usuario ha clicado el boton false
        }
        if isCorrect {
            self.correctQuestionAnswered += 1
            self.currentScore += 100*self.correctQuestionAnswered
            ProgressHUD.showSuccess("Enorabuena.. \n \(self.currentQuestion.answerExplanation)")
           
        } else {
            ProgressHUD.showError("Lástima... \n \(self.currentQuestion.answerExplanation)")
        }
        
        self.playSound(succes: isCorrect)
        
        self.askNextQuestion()
        self.updateUIElements()
        
    }
    
    func playSound(succes:Bool) {
        guard let succesUrl = Bundle.main.url(forResource: "succes", withExtension: "mp3") ,
            let failUrl = Bundle.main.url(forResource: "fail", withExtension: "mp3") else {return}
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode:.default)
            try AVAudioSession.sharedInstance().setActive(true)
            if succes {
               let player = try AVAudioPlayer(contentsOf: succesUrl, fileTypeHint: AVFileType.mp3.rawValue)
                
                player.play()
            } else {
                let player = try AVAudioPlayer(contentsOf: failUrl, fileTypeHint: AVFileType.mp3.rawValue)
                              
                              player.play()
            }
        } catch let error {
            print(error.localizedDescription)
        }
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
}

