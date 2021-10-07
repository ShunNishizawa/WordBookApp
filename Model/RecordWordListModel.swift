//
//  File.swift
//  WordBookApp
//
//  Created by 西澤駿 on 2021/09/01.
//

import Foundation
import RealmSwift

/// 登録単語格納クラス
class RecordWordListModel:Object,Identifiable{
    @objc dynamic var id = UUID()
    @objc dynamic var recordWord: String = "" //登録する単語
    @objc dynamic var memo: String = "" //単語に関するメモ
    @objc dynamic var numberOfIncorrectAnswers: Int = 0 //テストの不正回数（過去にテストで間違えた回数）⇨テスト結果モデルの最新不正解回数を受け取るようにする
    
    override static func primaryKey() -> String? {
        return "id"
    }
}
