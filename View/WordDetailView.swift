//
//  WordDetail.swift
//  WordBookApp
//
//  Created by 西澤駿 on 2021/09/07.
//

import SwiftUI
import KeyboardObserving

struct WordDetailView: View {
    @State var word: String = "" //登録単語
    @State var memo: String = "" //付随メモ
    @State var numberOfIncorrectAnswers: Int //テストで間違えた回数
    @State var presentWord: String = "" //現在登録されている単語を保存するための変数
    @State var presentMemo: String = "" //現在登録されているメモを保存するための変数
    @Environment(\.editMode) var editmode //編集モードの取得
    
    var body: some View {
        VStack{
            NavigationView{
                VStack{
                    if editmode?.wrappedValue == .active{
                        VStack{
                            //単語編集
                            HStack{
                                Text("単語")
                                TextField("", text: $word)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                    .padding()
                            }
                            
                            //メモ編集
                            HStack{
                                Text("解説：")
                                TextEditor(text: $memo)
                                    .frame(width: 300, height: 400, alignment: .leading)
                                    .border(Color.white)
                                    .lineSpacing(10.0)
                                    .padding()
                            }
                        }
                    }else{
                        Text(word)
                            .font(.title)
                        HStack{
                            Text("解説：")
                            Text(memo)
                        }
                    }
                    
//                    HStack{
//                        Text("テスト不正解数：")
//                        Text(String(numberOfIncorrectAnswers))
//                    }
                    Spacer()
                }
            }
            .navigationBarItems(trailing: HStack{
                WordEditButton(updateWord: word, updateMemo: memo, presentWord: presentWord, presentMemo: presentMemo)
                WordDeleteButton(deleteWord: word)
            } )
        }
    }
}

struct WordDetailView_Previews: PreviewProvider {
    static var previews: some View {
        WordDetailView( numberOfIncorrectAnswers: 5)
    }
}
