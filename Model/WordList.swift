//
//  WordLists.swift
//  WordBookApp
//
//  Created by 西澤駿 on 2021/09/07.
//

import Foundation

struct WordList: Identifiable {
    var id = UUID()
    var word: String
    var memo: String
}
