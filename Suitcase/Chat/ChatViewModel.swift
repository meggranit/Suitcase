//
//  ChatViewModel.swift
//  Suitcase
//
//  Created by meg on 12/17/22.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore
import FirebaseCore
import FirebaseFirestoreSwift

class ChatViewModel: ObservableObject {
    var chatModel = ChatModel.shared
    var tripModel = TripModel.shared
    var selectedTrip: String
    
    @Published var messages: [Chat] = []
    let db = Firestore.firestore()
    
    init(selectedTrip: String) {
        self.selectedTrip = selectedTrip
        messages = chatModel.messages
        chatModel.observeAllMessages(selectedTrip: selectedTrip)
        NotificationCenter.default.addObserver(self, selector: #selector(updateList), name: Notification.Name(kChatInfoUpdated), object: nil)
    }
    
    @objc
    
    func updateList() {
        messages = chatModel.messages
    }
    
}

