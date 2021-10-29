//
//  MailView.swift
//  WordBookApp
//
//  Created by 西澤駿 on 2021/09/05.
//

import SwiftUI
import MessageUI

struct MailView: UIViewControllerRepresentable {
    @Binding var isMailScreenShowing: Bool
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<MailView>) -> UIViewController{
        let controller = MFMailComposeViewController()
        controller.mailComposeDelegate = context.coordinator
        controller.setSubject("件名")
        controller.setToRecipients(["nishizawa.shun.819@gmail.com"])
        controller.setMessageBody("改善点や要望をお書きください。", isHTML: false)
        return controller
    }
    
    func makeCoordinator() -> MailView.Coordinator {
        return Coordinator(parent: self)
    }
    
    class Coordinator: NSObject, MFMailComposeViewControllerDelegate, UINavigationControllerDelegate {
        let parent: MailView
        
        init(parent: MailView) {
            self.parent = parent
        }

        func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
            // 終了時の処理あれこれ
            self.parent.isMailScreenShowing = false
        }
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<MailView>) {
    }
}
