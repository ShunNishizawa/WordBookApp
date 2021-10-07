//
//  WordList.swift
//  WordBookApp
//
//  Created by 西澤駿 on 2021/09/03.
//

import SwiftUI
import RealmSwift

struct WordListView: View {
    @State private var searchText: String = ""
    @StateObject var dbModelView = DBModelView()
    
    var body: some View {
        NavigationView {
            ZStack{
                VStack {
                    Spacer()
                    //TODO: 登録単語を検索できるようにする
                    //WordSearchBar(searchWordText: $searchText, placeholder: "SearchWord")
                    
                    List {
                        ForEach(dbModelView.words) { word in
                            NavigationLink(
                                destination: WordDetailView(word: word.recordWord, memo: word.memo, numberOfIncorrectAnswers: word.numberOfIncorrectAnswers, presentWord: word.recordWord, presentMemo: word.memo),
                                label: {
                                    Text(word.recordWord)
                                })
                        }
                        //.onDelete(perform: dbModelView.deleteData)
                    }
                }
                PlusButton()
                    .environmentObject(dbModelView)
            }.navigationBarTitle("単語リスト")
        }
    }
}

struct WordList_Previews: PreviewProvider {
    static var previews: some View {
        WordListView()
    }
}
