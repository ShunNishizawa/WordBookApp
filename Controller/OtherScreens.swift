//
//  OtherScreens.swift
//  WordBookApp
//
//  Created by 西澤駿 on 2021/09/04.
//

import SwiftUI
import MessageUI

struct OtherScreens: View {
    @State private var isShowingMaileView = false
    @State private var isShowingHowTo = false
    
    
    var body: some View {
        VStack(spacing: 30){
            
            Button(action: {
                self.isShowingMaileView.toggle()
            }){
                Text("お問い合わせ")
                    .frame(width: 200, height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .foregroundColor(Color.white)
                    .background(Color.blue)
            }.disabled(!MFMailComposeViewController.canSendMail())
            .sheet(isPresented: $isShowingMaileView, content: {
                MailView(isMailScreenShowing: self.$isShowingMaileView)
            })
            
            Button(action: {
                self.isShowingHowTo.toggle()
            }){
                Text("利用方法")
                    .frame(width: 200, height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .foregroundColor(Color.white)
                    .background(Color.green)
            }.sheet(isPresented: $isShowingHowTo){
                HowToView()
            }
        }
    }
}

struct OtherScreens_Previews: PreviewProvider {
    static var previews: some View {
        OtherScreens()
    }
}
