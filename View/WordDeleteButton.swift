//
//  DeleteButton.swift
//  WordBookApp
//
//  Created by 西澤駿 on 2021/09/21.
//

import SwiftUI

struct WordDeleteButton: View {
    @StateObject var dbModelView = DBModelView()
    @State var deleteWord = ""
    @State private var showingAlert = false   // アラートの表示フラグ
    @State private var toWordListView = false
    
    var body: some View {
        Button(action:{
            showingAlert = true
        }){
            Text("削除")
        }
        .alert(isPresented: $showingAlert){
            Alert(title: Text("確認"), message: Text("削除してもよろしいでしょうか？"), primaryButton: .cancel(Text("キャンセル")), secondaryButton: .default(Text("削除"), action: {
                dbModelView.deleteData(deleteWord: deleteWord)
                toWordListView = true
            }))
        }
        
        NavigationLink(destination: WordListView(), isActive: $toWordListView) {
            EmptyView()
        }
    }
}
