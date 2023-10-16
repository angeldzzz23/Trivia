//
//  Categories.swift
//  Trivia
//
//  Created by Angel Zambrano on 10/16/23.
//

import Foundation


struct TriviaCategory: Codable {
    let id: Int
    let name: String
}

struct TriviaCategoryResponse: Codable {
    let triviaCategories: [TriviaCategory]

    enum CodingKeys: String, CodingKey {
        case triviaCategories = "trivia_categories"
    }
}
