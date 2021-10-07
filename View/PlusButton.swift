//
//  PlusButton.swift
//  WordBookApp
//
//  Created by 西澤駿 on 2021/09/03.
//

import SwiftUI

struct PlusButton: View {
    @State private var showRecordWordScreenFlg = false
    @StateObject var dbModelView = DBModelView()
    
    var body: some View {
        VStack{
            Spacer()
            HStack{
                Spacer()
                Button(action: {
                    self.showRecordWordScreenFlg.toggle()
                }, label:{
                    Image("Plus1")
                })
                .sheet(isPresented: $showRecordWordScreenFlg){
                    RecordWord()
                        .environmentObject(dbModelView)
                }
                .frame(width: 60, height: 60)
                .cornerRadius(30.0)
                .shadow(color: .gray, radius: 3, x: 3, y: 3)
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 16.0, trailing: 20.0))
            }
        }
    }
}

struct PlusButton_Previews: PreviewProvider {
    static var previews: some View {
        PlusButton()
    }
}
