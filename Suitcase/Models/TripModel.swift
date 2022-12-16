//
//  TripModel.swift
//  Suitcase
//
//  Created by meg on 12/5/22.
//

import Foundation

struct Trip: Identifiable, Codable {
    var documentID: String?
    var id: String
    var tripName: String
    var location: String
    var startDate: Date
    var endDate: Date
    
    init(id:String, tripName: String, location:String, startDate: Date, endDate: Date){
        self.id = id
        self.tripName = tripName
        self.location = location
        self.startDate = startDate
        self.endDate = endDate
    }
    
    init?(data: [String: Any], documentID: String){
        guard let tripName = data["tripName"] as? String,
              let location = data["location"] as? String,
              let startDate = data["startDate"] as? Date,
              let endDate = data["endDate"] as? Date,
              let id = data["id"] as? String else {
              return nil
          }
          self.documentID = documentID
        self.tripName = tripName
        self.location = location
        self.startDate = startDate
        self.endDate = endDate
        self.id = id
    }
    func asDictionary() -> [String: Any] {
        return ["id": self.id,
                "tripName": self.tripName,
                "location": self.location,
                "startDate": self.startDate,
                "endDate": self.endDate
        ]
    }
}
