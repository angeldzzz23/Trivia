//
//  Trivia.swift
//  Trivia
//
//  Created by Angel Zambrano on 10/16/23.
//

import Foundation


// this would be the trivia logic
class Trivia {
    private var questions = [TriviaQuestion]()
    private var currQuestionIndex = 0
    private var numCorrectQuestions = 0
    
    
    func startGame(with questions: [TriviaQuestion]) {
        self.questions = questions
        currQuestionIndex = 0
        numCorrectQuestions = 0
    }
    
    
    
}

