//
//  RecordWord.swift
//  WordBookApp
//
//  Created by 西澤駿 on 2021/10/03.
//

import SwiftUI
import RealmSwift

struct RecordWord: View {
    @State private var showingAlert = false   // アラートの表示フラグ
    @State private var completeRecordingWordAlert = false //単語登録完了アラート表示フラグ
    @EnvironmentObject var dbModelView: DBModelView
    @State var alertItemModel: AlertItemModel?
    let realm = try! Realm()
    
    //登録単語が入力されているか否かを判定
    var recordWordIsValid: Bool {
        return !dbModelView.recordWord.isEmpty
    }
    
    init() {
       UITextView.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        NavigationView{
            
            ZStack{
                Color.white
                    .opacity(0.4)
                    .edgesIgnoringSafeArea(.all)
                    .onTapGesture {
                        UIApplication.shared.closeKeyboard()
                    }
                
                VStack(spacing: 20){
                    HStack{
                        Text("単語")
                            .frame(width: 40, height: 30, alignment: .leading)
                        TextField("登録単語", text: $dbModelView.recordWord)
//                            .frame(width: 300, height: 100)
//                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .autocapitalization(.none)
                            .overlay(
                                RoundedRectangle(cornerSize: CGSize(width: 8.0, height: 8.0))
                                .stroke(Color.black, lineWidth: 1.0)
                                .padding(-8.0)
                        )
                        .padding(16.0)
                        Spacer()
                    }
                
                    HStack{
                        Text("解説")
                            .frame(width: 40, height: 30, alignment: .leading)
                        TextEditor(text: $dbModelView.memo)
                            .frame(width: 300, height: 400, alignment: .leading)
                            .border(Color.black, width: 1)
                            .lineSpacing(10.0)
                            .padding()
                        
                        //TODO: バージョンアップ時にUIの変更をする箇所
//                        Image("WordCard")
//                            .resizable()
//                            .scaledToFit()
//                            .frame(width: 400.0, height: 400.0, alignment: .leading)
//                            .overlay(
//                                TextEditor(text: $dbModelView.memo)
//                                    .frame(width: 300, height: 400, alignment: .leading)
//                                    .border(Color.white)
//                                    .lineSpacing(10.0)
//                                    .padding()
//                                )
                    }
                    
                    Button(action: {
                        self.alertItemModel = AlertItemModel(title: Text("確認"), message: Text("入力した内容で登録してもよろしいでしょうか？"), primaryButton: .default(Text("完了"), action: {
                            let results = realm.objects(RecordWordListModel.self).filter("recordWord = '\(dbModelView.recordWord)'")
                            let count = results.count

                            //単語の重複登録回避処理
                            if count == 0{
                                dbModelView.addData()
                                dbModelView.recordWord = ""
                                dbModelView.memo = ""
                                self.alertItemModel = AlertItemModel(title: Text("登録完了"), message: Text("登録が完了しました。"), dismissButton: .default(Text("OK")))
                            }else{
                                self.alertItemModel = AlertItemModel(title: Text("エラー"), message: Text("すでに登録されている単語です"), dismissButton: .default(Text("OK")))
                            }
                        }),  secondaryButton: .cancel(Text("キャンセル"), action: {
                            return
                        }))
                    }){
                        Text("登録")
                            .frame(width: 100, height: 50)
                            .font(.largeTitle)
                            .background(Color.orange)
                    }
                    .alert(item: $alertItemModel) { alertItem in
                        var alertObj: Alert = Alert(
                            title: alertItem.title,
                            message: alertItem.message,
                            dismissButton: alertItem.dismissButton
                        )

                        if( alertItem.dismissButton == nil ){
                            alertObj = Alert(
                                title: alertItem.title,
                                message: alertItem.message,
                                primaryButton: alertItem.primaryButton!,
                                secondaryButton: alertItem.secondaryButton!
                            )
                        }
                        return alertObj
                    }.disabled(!recordWordIsValid)
                }
            }
        }
        .navigationTitle("単語登録")
    }
}

extension UIApplication {
    func closeKeyboard() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
