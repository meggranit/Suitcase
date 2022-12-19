//
//  Chat.swift
//  Suitcase
//
//  Created by meg on 12/18/22.
//

import Foundation
import FirebaseFirestore

struct Chat: Identifiable, Codable {
    var documentID: String?
    var id: String
    var messageText: String
    var sentAt: String
    var sentBy: String
    
    init(id: String, messageText: String, sentAt: String, sentBy: String){
        self.id = id
        self.messageText = messageText
        self.sentAt = sentAt
        self.sentBy = sentBy
    }
    
    init?(data: [String: Any], documentID: String){
        guard let messageText = data["messageText"] as? String,
              let sentAt = data["sentAt"] as? String,
              let sentBy = data["sentBy"] as? String,
              let id = data["id"] as? String else {
            print("error initializing chat")
            return nil
        }
        self.documentID = documentID
        self.messageText = messageText
        self.sentBy = sentBy
        self.sentAt = sentAt
        self.id = id
    }
    func asDictionary() -> [String: Any] {
        return ["id": self.id,
                "messageText": self.messageText,
                "sentAt": self.sentAt,
                "sentBy": self.sentBy
        ]
    }
}

