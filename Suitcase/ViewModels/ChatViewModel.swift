//
//  ChatViewModel.swift
//  Suitcase
//
//  Created by meg on 12/2/22.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore
import FirebaseCore
import FirebaseFirestoreSwift

class ChatViewModel: ObservableObject {
    @Published private(set) var messages: [Chat] = []
    @Published private(set) var lastMessageID = ""
    let db = Firestore.firestore()
    
    init() {
        getMessages()
    }
    
    func getMessages(){
        db.collection("/users/mWQXNGdncm2dpAzyQeUr/Trips/hElJ2J8wxcXNZDiIHMLa/Chat").addSnapshotListener { querySnapshot, error in
            guard let documents = querySnapshot?.documents else {
                print("error fetching documents: \(String(describing: error))")
                return
            }
            self.messages = documents.compactMap { document -> Chat? in
                do {
                    return try document.data(as: Chat.self)
                } catch {
                    print("error decoding document into message: \(error)")
                    return nil
                }
            }
            self.messages.sort { $0.sentAt < $1.sentAt }
            if let id = self.messages.last?.id {
                self.lastMessageID = id
            }
        }
    }
    
    func sendMessage(text: String) {
        do {
            let newMessage = Chat(id: "\(UUID())", messageText: text, received: false, sentAt: Date(), sentBy: "mWQXNGdncm2dpAzyQeUr")
            try db.collection("/users/mWQXNGdncm2dpAzyQeUr/Trips/hElJ2J8wxcXNZDiIHMLa/Chat").document().setData(from: newMessage)
        } catch {
            print("error adding message to firestore: \(error)")
        }
    }
}
