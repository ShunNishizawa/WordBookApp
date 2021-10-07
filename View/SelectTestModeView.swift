//
//  TestView.swift
//  WordBookApp
//
//  Created by 西澤駿 on 2021/09/05.
//

import SwiftUI
import RealmSwift

struct SelectTestModeView: View {
    
    var body: some View {
        NavigationView{
            VStack{
                let realm = try! Realm()
                let results = realm.objects(RecordWordListModel.self)
                let recordWords = results.count
                
                NavigationLink(
                    destination: TestSettingView(numberOfQuestions: 0, numberOfRecordedWords: recordWords),
                    label: {
                        Text("テスト実施")
                    })
                    .padding()
                
                NavigationLink(
                    destination: TestResults(),
                    label: {
                        Text("テスト結果確認")
                    })
            }
        }
    }
}

struct SelectTestModeView_Previews: PreviewProvider {
    static var previews: some View {
        SelectTestModeView()
    }
}
