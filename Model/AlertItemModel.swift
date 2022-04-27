//
//  AlertItemModel.swift
//  WordBookApp
//
//  Created by 西澤駿 on 2021/09/30.
//

import Foundation
import SwiftUI

struct AlertItemModel: Identifiable{
    var id = UUID()
    var title: Text
    var message: Text?
    var dismissButton: Alert.Button?
    var primaryButton: Alert.Button?
    var secondaryButton: Alert.Button?
}
