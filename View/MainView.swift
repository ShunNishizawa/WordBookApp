//
//  MainView.swift
//  WordBookApp
//
//  Created by 西澤駿 on 2021/09/05.
//

import SwiftUI

enum Tabs: String {
    case list = "List"
    case test = "Test"
    case other = "Other"
}

struct MainView: View {
    @State private var selectedTab: Tabs = .list
    
    var body: some View {
        //TODO: 各タブにアイコン画像を入れる
        TabView(selection: $selectedTab){
            WordListView()
                .tabItem {
                    Text("リスト")
                }.tag(Tabs.list)
            
            SelectTestModeView()
                .tabItem {
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
        SelectTestModeView()
        WordListView()
        OtherScreens()
    }
}
