//
//  ChatModel.swift
//  Suitcase
//
//  Created by meg on 12/2/22.
//

import Foundation

struct Chat: Identifiable, Codable {
    var id: String
    var messageText: String
    var received: Bool
    var sentAt: Date
    var sentBy: String
}
