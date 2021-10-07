//
//  SearchBarView.swift
//  WordBookApp
//
//  Created by 西澤駿 on 2021/09/02.
//

import SwiftUI

struct WordSearchBar: UIViewRepresentable {
    @Binding var searchWordText: String
    var placeholder: String
    var searchBarStyle = UISearchBar.Style.minimal
    var autocapitalizationType = UITextAutocapitalizationType.none
    
    func makeCoordinator() -> WordSearchBar.Coordinator {
        return Coordinator(searchWordText: $searchWordText)
    }
    
    /// UIKitのUIViewオブジェクトをインスタンス化して、初期化する
    /// - Parameter context:UIViewRepresentableに準拠するもの
    /// - Returns: UISearchBar
    func makeUIView(context: UIViewRepresentableContext<WordSearchBar>) -> UISearchBar {
        let searchBar = UISearchBar(frame: .zero)
        searchBar.delegate = context.coordinator
        searchBar.searchBarStyle  = searchBarStyle
        searchBar.autocapitalizationType = autocapitalizationType
        searchBar.placeholder = placeholder
        return searchBar
    }
    
    /// SwiftUIが更新された時に指定されたViewを更新
    /// - Parameters:
    ///   - uiView: UISearchBar
    ///   - context: UIViewRepresentableに準拠するもの
    func updateUIView(_ uiView: UISearchBar, context: UIViewRepresentableContext<WordSearchBar>) {
        uiView.text = searchWordText
    }
    
    class Coordinator: NSObject, UISearchBarDelegate{
        @Binding var searchWordText: String
        
        init(searchWordText: Binding<String>) {
            _searchWordText = searchWordText
        }
        
        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            searchWordText = searchText
        }
    }
}
