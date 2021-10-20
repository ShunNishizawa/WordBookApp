//
//  CorrectIncorrectAnswersModel.swift
//  WordBookApp
//
//  Created by 西澤駿 on 2021/10/16.
//

import Foundation
import SwiftUI
import Combine
 
class CorrectIncorrectAnswersModel: ObservableObject, Identifiable {
 
    @Published var score: Score?
    
    // EnvironmentObject を設定
    public func setShareData( score: Score ){
        self.score = score
    }
    
    // EnvironmentObject に値を設定
    public func setCorrect( correctAnswer: Int){
        self.score?.correctAnswer = correctAnswer
    }
    
    public func setIncorrect( incorrectAnswer: Int){
        self.score?.incorrectAnswer = incorrectAnswer
    }
}
