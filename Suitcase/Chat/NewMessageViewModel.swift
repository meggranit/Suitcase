//
//  NewMessageViewModel.swift
//  Suitcase
//
//  Created by meg on 12/18/22.
//

import Foundation


class NewMessageViewModel {
    let chatModel = ChatModel.shared
    let userModel = UserModel.shared
    let tripModel = TripModel.shared
    
    
    func addMessage(id: String, messageText: String, sentAt: String, selectedTrip: String){
        let message = Chat(id: id, messageText: messageText, sentAt: sentAt, sentBy: userModel.currentUserRef)
        chatModel.addChat(chat: message, docID: selectedTrip)
       
    }
    
    func findChat(search: String) -> Chat? {
        return nil
    }
    
    func updateChat(chat: Chat) {
        print("updateVM")
    }
}

