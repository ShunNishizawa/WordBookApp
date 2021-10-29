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
    
    var body: some View {
        let realm = try! Realm()
        let results = realm.objects(RecordWordListModel.self)
        let recordWords = results.count
        
        //TODO: 各タブにアイコン画像を入れる
        TabView(selection: $selectedTab){
            WordListView()
                .tabItem {
                    Text("リスト")
                }.tag(Tabs.list)
            
            TestSettingView(numberOfQuestions: 0, numberOfRecordedWords: recordWords).tabItem {
                Text("テスト")
            }.tag(Tabs.test)
            
            OtherScreens()
                .tabItem {
                    Text("その他")
                }.tag(Tabs.other)
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
