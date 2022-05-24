//
//  UserData.swift
//  TriviaGame
//
//  Created by Or Zino on 22/05/2022.
//

import Foundation

struct UserData: Codable {
    
    var qustion: String
    var answer1: String
    var answer2: String
    var answer3: String
    var answer4: String
    var image: String
    var correct: Int
    
}
