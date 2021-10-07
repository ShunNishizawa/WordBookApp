//
//  RecordDBModel.swift
//  WordBookApp
//
//  Created by 西澤駿 on 2021/09/04.
//

import Foundation
import RealmSwift

class DBModelView: ObservableObject{
    
    @Published var recordWord: String = "" //登録する単語
    @Published var memo: String = "" //単語に関するメモ
    @Published var numberOfIncorrectAnswers: Int = 0 //テストの不正回数（過去にテストで間違えた回数）
    @Published var testDate:Date = Date() //テスト実施日
    @Published var words: [RecordWordListModel] = []
    
    init(){
        fetchData()
    }
    
    func fetchData(){
        guard let dbRef = try? Realm() else {return }
        let results = dbRef.objects(RecordWordListModel.self)
        self.words = results.compactMap({(recordWordListModel)->RecordWordListModel? in
            return recordWordListModel
        })
    }
    
    /// 単語追加処理
    func addData(){
        objectWillChange.send()
        
        let recordWordListModel = RecordWordListModel()
        recordWordListModel.recordWord = recordWord
        recordWordListModel.memo = memo
        recordWordListModel.numberOfIncorrectAnswers = numberOfIncorrectAnswers
        
        guard let dbRef = try? Realm() else {return }
        try? dbRef.write{
            dbRef.add(recordWordListModel)
        }
        fetchData()
    }
    
    /// 単語削除処理
    /// - Parameter presentWord: 削除する単語
    func deleteData(deleteWord: String){
        
        let realm = try! Realm()
        let resultsDeleteWord = realm.objects(RecordWordListModel.self).filter("recordWord = '\(deleteWord)'")
        
        do{
            try realm.write{
                realm.delete(resultsDeleteWord)
            }
        }catch{
            return
        }
    }
    
    /// 登録単語の更新処理
    /// - Parameters:
    ///   - updateMemo: 編集メモ内容
    ///   - presentMemo: 現在のメモ内容
    
    func updateData(updateWord: String, updateMemo: String, presentWord: String, presentMemo: String){
        let realm = try! Realm()
        let resultsMemo = realm.objects(RecordWordListModel.self).filter("memo = '\(presentMemo)'")
        let resultsWord = realm.objects(RecordWordListModel.self).filter("recordWord = '\(presentWord)'")
        
        //DB更新処理
        try! realm.write{
            resultsMemo.setValue(updateMemo, forKey: "memo")
            resultsWord.setValue(updateWord, forKey: "recordWord")
        }
    }
    
    func addTestResults(){
        let testResultLiatModel = TestResultLiatModel()
        testResultLiatModel.incorrectAnswerWord = recordWord
        testResultLiatModel.incorrectAnswerMemo = memo
        testResultLiatModel.numberOfIncorrectAnswers = numberOfIncorrectAnswers
        testResultLiatModel.testDate = testDate
        
        //DBにテスト結果を追加
        guard let dbRef = try? Realm() else {return }
        try? dbRef.write{
            dbRef.add(testResultLiatModel)
        }
        fetchData()
    }
}

/// データ削除処理
/// - Parameter offsets: 削除する行
//    func deleteData(at offsets:IndexSet){
//
//        let recordWordListModel = RecordWordListModel()
//        if let realm = recordWordListModel.realm {
//            try! realm.write {
//                realm.delete(recordWordListModel[offsets.first!] as! ObjectBase)
//            }
//        } else {
//            recordWordListModel.recordWord.remove(at: offsets.first!)
//        }
//    }

