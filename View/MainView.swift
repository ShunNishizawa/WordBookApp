//
//  MainView.swift
//  WordBookApp
//
//  Created by 西澤駿 on 2021/09/05.
//

import SwiftUI
import RealmSwift

enum Tabs: String {
    case list = "List"
    case test = "TestSetting"
    case other = "Other"
}

struct MainView: View {
    @State private var selectedTab: Tabs = .list
    @State private var selection = 0
    
    var body: some View {
        let realm = try! Realm()
        let results = realm.objects(RecordWordListModel.self)
        let recordWords = results.count
        
        TabView(selection: $selection){
            WordListView()
                .tabItem {
                    Text("リスト")
                    Image(systemName: "list.dash")
                }.tag(1)
            
            TestSettingView(numberOfQuestions: 0, numberOfRecordedWords: recordWords).tabItem {
                Text("テスト")
                Image(systemName: "play")
            }.tag(2)
            
            OtherScreens()
                .tabItem {
                    Text("その他")
                    Image(systemName: "person.fill.questionmark")
                }.tag(3)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
        WordListView()
        TestSettingView(numberOfQuestions: 0, numberOfRecordedWords: 6)
        OtherScreens()
    }
}
