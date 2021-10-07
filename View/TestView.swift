//
//  TestView.swift
//  WordBookApp
//
//  Created by 西澤駿 on 2021/09/26.
//

import SwiftUI
import RealmSwift

struct TestView: View {
    @State var numberOfQuestions: Int //出題数
    var wordArray: [String] = [] //登録されている単語を一式格納
    var selectedWord: String? //取得する要素
    let realm = try! Realm()
    
    var body: some View {
        NavigationView{
            Text("\(numberOfQuestions)")
//            VStack{
//                Text("\(numberOfQuestions)")
//                let result = realm.objects(RecordWordListModel.self) //データを取得
//                let wordRandom = result.randomElement()
//                //ToDo: ForEachにする必要がある
//                for word in wordRandom{
//                    Text("\(word.recordWord)")
//                }
//            }
        }
        .navigationBarBackButtonHidden(true)
    }

}

func getWord(){
    var wordArray: [String] = [] //登録されている単語を一式格納
    var selectedWord: String? //取得する要素
    let realm = try! Realm()
    let result = realm.objects(RecordWordListModel.self) //データを取得


    if result.count == 0{
        selectedWord = ""
    }else{
        for i in 0..<result.count{
            wordArray.append(result[i].recordWord)
        }
        selectedWord = wordArray.randomElement()
    }
    print(selectedWord as Any)
}
