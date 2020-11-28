//
//  ChatItem.swift
//  Vyb Dating
//
//  Created by Bright Ahedor on 28/11/2020.
//

import SwiftUI


struct ChatItem: Identifiable {
    var id: String
    var firstName: String
    var lastName: String
    var image: String
    var lastMessage: String
    var lastDate: Date
    var location: String = ""
}

extension ChatItem {

    //MARK: init the
    init() {
        self.init(id: "45", firstName: "Bright", lastName: "Ahedor", image: "", lastMessage: "Hello", lastDate: Date())
    }
}

