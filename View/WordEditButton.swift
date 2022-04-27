//
//  WordEditButton.swift
//  WordBookApp
//
//  Created by 西澤駿 on 2021/09/18.
//

import SwiftUI

struct WordEditButton: View {
    @Environment(\.editMode) var editMode
    @StateObject var dbModelView = DBModelView()
    var updateWord = "" //編集後の単語
    var updateMemo = "" //編集後のメモ
    var presentWord = "" //現在登録されている単語
    var presentMemo = "" //現在登録されているメモ
    
    var body: some View {
        Button(action: {
            withAnimation(){
                
                //編集モード↔︎閲覧モードのどちらに切り替えるかを判定するための条件分岐
                if editMode?.wrappedValue.isEditing == true{
                    editMode?.wrappedValue = .inactive
                    dbModelView.updateData(updateWord: updateWord, updateMemo: updateMemo, presentWord: presentWord, presentMemo: presentMemo)
                }else{
                    editMode?.wrappedValue = .active
                }
            }
        }){
            
            //ボタンの表示名を"完了"↔︎"編集"に切り替えるための処理
            if editMode?.wrappedValue.isEditing == true{
                //編集→完了
                Text("完了")
            }else{
                //完了→編集
                Text("編集")
            }
        }
    }
}
