//
//  TestFinishView.swift
//  WordBookApp
//
//  Created by 西澤駿 on 2021/10/13.
//

import SwiftUI

struct TestFinishView: View {
    //@EnvironmentObject var score: Score
    @ObservedObject var score: Score = .shared
    @State private var toSelectedView = false
    @State private var toConfirmationView = false
    @Binding var isTestSettingView: Bool
    
    var body: some View {
        VStack{
            HStack{
                Text("出題数:")
                    .padding()
                Text("\(score.correctAnswer + score.incorrectAnswer)問")
            }
            
            //正解数表示
            HStack{
                Text("正解数:")
                    .padding()
                Text("\(score.correctAnswer)問")
            }
            
            //不正解数表示
            HStack{
                Text("不正解数:")
                    .padding()
                Text("\(score.incorrectAnswer)問")
            }
            
            Button(action: {
                self.isTestSettingView = false
            }, label: {
                Text("トップへ")
            })
//            NavigationLink {
//                ConfirmationView()
//            } label: {
//                Text("不正解単語確認")
//            }
//
//            
//            NavigationLink {
//                TestSettingView()
//            } label: {
//                Text("トップへ")
//            }
        }
        .navigationBarBackButtonHidden(true)
    }
    
    
}
