//
//  WordDetail.swift
//  WordBookApp
//
//  Created by 西澤駿 on 2021/09/07.
//

import SwiftUI
import KeyboardObserving

struct WordDetailView: View {
    @StateObject var dbModelView = DBModelView()
    @State var word: String = "" //登録単語
    @State var memo: String = "" //付随メモ
    @State var numberOfIncorrectAnswers: Int //テストで間違えた回数
    @State var presentWord: String = "" //現在登録されている単語を保存するための変数
    @State var presentMemo: String = "" //現在登録されているメモを保存するための変数
    @State private var isShowingAlert = false
    @Binding var isWordListViewActive: Bool
    @Environment(\.presentationMode) var presentationMode
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
                                    .autocapitalization(.none)
                                    .overlay(
                                        RoundedRectangle(cornerSize: CGSize(width: 8.0, height: 8.0))
                                        .stroke(Color.black, lineWidth: 1.0)
                                        .padding(-8.0)
                                )
                                .padding(16.0)
                            }
                            
                            //メモ編集
                            HStack{
                                Text("解説：")
                                TextEditor(text: $memo)
                                    .frame(width: 300, height: 400, alignment: .leading)
                                    .border(Color.white)
                                    .lineSpacing(10.0)
                                    .border(Color.black, width: 1)
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
                Button(action:{
                    isShowingAlert = true
                }){
                    Text("削除")
                }
                .alert(isPresented: $isShowingAlert){
                    Alert(title: Text("確認"), message: Text("削除してもよろしいでしょうか？"), primaryButton: .cancel(Text("キャンセル")), secondaryButton: .default(Text("削除"), action: {
                        dbModelView.deleteData(deleteWord: word)
                        self.isWordListViewActive = false
                    }))
                }
            } )
        }
    }
}

//struct WordDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        WordDetailView( numberOfIncorrectAnswers: 5)
//    }
//}
