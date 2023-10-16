//
//  ChoosingGameTypeViewController.swift
//  Trivia
//
//  Created by Angel Zambrano on 10/16/23.
//

import UIKit

// this viewcontroller is the one where the user chooses the category and difficulty

class ChoosingGameTypeViewController: UIViewController {

    
    // created these two pickerviews
    @IBOutlet weak var difficultyPickerView: UIPickerView!
    
    @IBOutlet weak var categoryPickerView: UIPickerView!
    
    
    // https://opentdb.com/api_category.php
    // I created this map based on the API^
    // in theory you could do an API request and then just fill in that data into this map
    let categoryMap: [Int: String] = [
        9: "General Knowledge",
        10: "Entertainment: Books",
        11: "Entertainment: Film",
        12: "Entertainment: Music",
        13: "Entertainment: Musicals & Theatres",
        14: "Entertainment: Television",
        15: "Entertainment: Video Games",
        16: "Entertainment: Board Games",
        17: "Science & Nature",
        18: "Science: Computers",
        19: "Science: Mathematics",
        20: "Mythology",
        21: "Sports",
        22: "Geography",
        23: "History",
        24: "Politics",
        25: "Art",
        26: "Celebrities",
        27: "Animals",
        28: "Vehicles",
        29: "Entertainment: Comics",
        30: "Science: Gadgets",
        31: "Entertainment: Japanese Anime & Manga",
        32: "Entertainment: Cartoon & Animations"
    ]

    /// this will contain all of the strings all of the values of category map (no ids)
    var categories = [String]() // Extracting category names from the categoryMap dictionary

    // the dropdown menu gives us this info
    // the api uses strings instead of ids for difficulty level
    let difficultyLevels = ["easy", "medium", "hard"]

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // created delegates
          categoryPickerView.delegate = self
          categoryPickerView.dataSource = self
          difficultyPickerView.delegate = self
          difficultyPickerView.dataSource = self
        
        
        categories = Array(categoryMap.values)
        
        // you would call the api.getcategories here and add them categoryMap
//        API.fetchTriviaCategories { result in
//            switch result {
//            case .success(let categories):
//                // Handle fetched categories
                  // you would modify this to create a hashmap 
//            case .failure(let error):
//                // Handle error
//                print("Error fetching trivia categories: \(error)")
//            }
//        }
        
    }
    
    
    // preparing for segue
    
    // MARK: Preparing for segue
    // overriding this method
    // this method is called right before the segue happens.
    // this is how we would pass data from one viewcontroller to another
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "startGameSegue" {
            if let triviaViewController = segue.destination as? TriviaViewController {
                // Pass any necessary data to TriviaViewController here
                
                // getting the selected category
                let selectedCategory = categories[categoryPickerView.selectedRow(inComponent: 0)]
                
                // getting the id from hash map given the selectedCategory
                if let categoryId = categoryMap.first(where: { $0.value == selectedCategory })?.key {
                    // initializing the selectedCategoryId property inside of TriviaViewController
                    triviaViewController.selectedCategoryId = categoryId
                }
                
                // initializing the other properties inside of TriviaViewController
                let selectedDifficulty = difficultyLevels[difficultyPickerView.selectedRow(inComponent: 0)]
                triviaViewController.selectedCategory = selectedCategory
                triviaViewController.selectedDifficulty = selectedDifficulty
            }
        }
    }
}

// MARK: conforming to delegate and data source

extension ChoosingGameTypeViewController: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        // since we have two pickerviews, we have to see which one is which
        if pickerView == categoryPickerView {
              return categories[row]
          } else {
              return difficultyLevels[row]
          }
      }
}

extension ChoosingGameTypeViewController: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
          return 1
      }
      
      func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
          if pickerView == categoryPickerView {
              return categories.count
          } else {
              return difficultyLevels.count
          }
      }
    
}


