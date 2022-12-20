//
//  InvitedTrip.swift
//  Suitcase
//
//  Created by meg on 12/20/22.
//

import Foundation
import FirebaseFirestore

struct InvitedTrip: Identifiable, Codable {
    var documentID: String?
    var id: String
    var tripID: String
    var userID: String
    
    
    init(id:String, tripID: String, userID: String){
        self.id = id
        self.tripID = tripID
        self.userID = userID
    }
    
    init?(data: [String: Any], documentID: String){
        guard let userID = data["userID"] as? String,
              let tripID = data["tripID"] as? String,
              let id = data["id"] as? String else {
            print("error initializing trips ")
              return nil
          }
          self.documentID = documentID
        self.tripID = tripID
        self.userID = userID
        self.id = id
    }
    func asDictionary() -> [String: Any] {
        return ["id": self.id,
                "tripID": self.tripID,
                "userID": self.userID
        ]
    }
}
