//
//  ChatMessageViewModel.swift
//  Vyb Dating
//
//  Created by Bright Ahedor on 28/11/2020.
//

import SwiftUI

protocol ChatMessageViewModelProtocol {
    //MARK: - PROTOCOL DEFINITIONS
    var  chats: [ChatItem] {get}
    func addNewChat(chat: ChatItem)
    func deleteChat(chat: ChatItem)
}

final class ChatMessageViewModel : ChatMessageViewModelProtocol, ObservableObject {
    //MARK: - PROPERTIES
    @Published var chats: [ChatItem] = []

    init() {
        self.chats.append(ChatItem())
        self.chats.append(ChatItem())
        self.chats.append(ChatItem())
        self.chats.append(ChatItem())
        self.chats.append(ChatItem())
        self.chats.append(ChatItem())
    }
}

extension ChatMessageViewModel {
    //MARK: - Functions implementations

    func addNewChat(chat: ChatItem) {
    
    }
    
    func deleteChat(chat: ChatItem) {
       
    }
}
