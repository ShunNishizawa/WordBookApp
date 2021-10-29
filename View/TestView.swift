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
    @State var show = true
    @StateObject var dbModelView = DBModelView()
    @State private var showAnswerView = false //解答画面出力フラグ
    let realm = try! Realm()
    private let questionWord = DBModelView().getWord() //出題単語
    
    var body: some View {
            VStack(alignment: .center){
                
                Image("WordCard")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 400.0, height: 400.0, alignment: .leading)
                    .overlay(
                        Text(questionWord)
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .foregroundColor(.red))
                
                NavigationLink(destination: AnswerView(numberOfQuestions: numberOfQuestions, questionWord: questionWord)) {
                    Text("解答確認")
                        .fontWeight(.semibold)
                        .frame(width: 160, height: 48)
                        .foregroundColor(Color(.white))
                        .background(Color(.blue))
                        .cornerRadius(24)
                }
                
                HStack{
                    Text("残り出題数:")
                        .padding()
                    Text("\(numberOfQuestions)問")
                    
                }
            }
        .navigationBarBackButtonHidden(true)
    }
}
