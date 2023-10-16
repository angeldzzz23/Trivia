//
//  API.swift
//  Trivia
//
//  Created by Angel Zambrano on 10/16/23.
//

import Foundation

// creating a class to do the api response

// MARK:
class API {
    
    
   static func fetchTriviaQuestions(completion: @escaping (Result<[TriviaQuestion], Error>) -> Void) {
        guard let url = URL(string: "https://opentdb.com/api.php?amount=10") else {
            completion(.failure(NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"])))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "No data received"])))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let triviaData = try decoder.decode(TriviaResult.self, from: data)
                
                if let trivData = triviaData.results {
                    completion(.success(trivData))
                } else {
                    completion(.success([TriviaQuestion]()))
                }

            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
    
    static func fetchTriviaQuestions2(category: Int? = nil, difficulty: String? = nil, completion: @escaping (Result<[TriviaQuestion], Error>) -> Void) {
        var urlString = "https://opentdb.com/api.php?amount=10"
        
        if let category = category {
            urlString += "&category=\(category)"
        }
        
        if let difficulty = difficulty {
            urlString += "&difficulty=\(difficulty)"
        }
        
        guard let url = URL(string: urlString) else {
            completion(.failure(NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"])))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "No data received"])))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let triviaData = try decoder.decode(TriviaResult.self, from: data)
                
                if let trivData = triviaData.results {
                    completion(.success(trivData))
                } else {
                    completion(.success([TriviaQuestion]()))
                }
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
    
    
    
    
    

    
}
