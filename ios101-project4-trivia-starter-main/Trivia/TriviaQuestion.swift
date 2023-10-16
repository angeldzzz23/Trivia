//
//  TriviaQuestion.swift
//  Trivia
//
//  Created by Mari Batilando on 4/6/23.
//

import Foundation

struct TriviaResult: Codable {
    let responseCode: Int
    let results: [TriviaQuestion]?
    
    enum CodingKeys: String, CodingKey {
        case responseCode = "response_code"
        case results
    }
}


struct TriviaQuestion: Codable {
  let category: String
  let question: String
    let type: String
  let correct_answer: String
  let incorrect_answers: [String]
}
