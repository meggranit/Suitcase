//
//  Plan.swift
//  Suitcase
//
//  Created by Meghan Granit on 12/17/22.
//

import Foundation
import Firebase
import FirebaseFirestore

struct Plan: Identifiable, Codable {
    var documentID: String?
    var id: String
    var eventName: String
    var eventDescription: String
    var addedBy: String
    var startDate: String
    var endDate: String
    
    init(id: String, eventName: String, eventDescription: String, addedBy: String, startDate: String, endDate: String) {
        self.id = id
        self.eventName = eventName
        self.eventDescription = eventDescription
        self.addedBy = addedBy
        self.startDate = startDate
        self.endDate = endDate
    }
    
    init?(data: [String: Any], documentID: String) {
        guard let eventName = data["eventName"] as? String,
              let eventDescription = data["eventDescription"] as? String,
              let addedBy = data["addedBy"] as? String,
              let startDate = data["startDate"] as? String,
              let endDate = data["endDate"] as? String,
              let id = data["id"] as? String else {
            print("error initializing plans ")
              return nil
          }
        self.documentID = documentID
        self.eventName = eventName
        self.eventDescription = eventDescription
        self.addedBy = addedBy
        self.startDate = startDate
        self.endDate = endDate
        self.id = id
    }
    
    func asDictionary() -> [String: Any] {
        return ["id": self.id,
                "eventName": self.eventName,
                "eventDescription": self.eventDescription,
                "addedBy": self.addedBy,
                "startDate": self.startDate,
                "endDate": self.endDate
        ]
    }
    
}
