//
//  AnswerView.swift
//  WordBookApp
//
//  Created by 西澤駿 on 2021/10/10.
//

import SwiftUI
import RealmSwift

struct AnswerView: View {
    @State var numberOfQuestions: Int
    @State var toResultView = false //最終結果画面表示フラグ
    @State var toTestView = false //テスト画面へ戻るためのフラグ
    @State var questionWord: String //出題単語
    //@EnvironmentObject var score: Score
    @ObservedObject var score: Score = .shared
    @StateObject var dbModelView = DBModelView()
    
    var body: some View {
        VStack{
            let realm = try! Realm()
            let results = realm.objects(RecordWordListModel.self).filter("recordWord = '\(questionWord)'")
            
            Text(dbModelView.getMemo(word: questionWord))
            
            HStack{
                Button(action:{
                    numberOfQuestions = numberOfQuestions - 1
                    self.score.correctAnswer += 1
                    
                    if numberOfQuestions == 0{
                        toResultView = true
                    }else{
                        toTestView = true
                    }
                }){
                    Text("正解")
                }
                
                Button(action:{
                    numberOfQuestions = numberOfQuestions - 1
                    self.score.incorrectAnswer += 1
                    
                    if numberOfQuestions == 0{
                        toResultView = true
                    }else{
                        toTestView = true
                    }
                }){
                    Text("不正解")
                }
            }
            
            NavigationLink(destination: TestView(numberOfQuestions: numberOfQuestions), isActive: $toTestView){
                EmptyView()
            }
            
            NavigationLink(destination: TestFinishView(), isActive: $toResultView){
                EmptyView()
            }
        }
        .navigationTitle(Text("解答"))
        .navigationBarBackButtonHidden(true)
    }
}

// 得点を保持するクラス
class Score: ObservableObject {
    private init() { }
        
        static let shared = Score()
    @Published var correctAnswer = 0
    @Published var incorrectAnswer = 0
}
