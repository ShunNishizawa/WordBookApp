//
//  TestResultLiat.swift
//  WordBookApp
//
//  Created by 西澤駿 on 2021/09/01.
//

import Foundation
import RealmSwift

/// テスト結果格納クラス
class TestResultLiatModel: Object, Identifiable{
    @objc dynamic var incorrectAnswerWord: String = "" //不正解単語
    @objc dynamic var incorrectAnswerMemo:String = "" //不正解単語のメモ
    @objc dynamic var numberOfIncorrectAnswers: Int = 0 //不正解回数
    @objc dynamic var testDate = Date() //実施日
}
