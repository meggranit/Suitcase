//
//  Member.swift
//  Suitcase
//
//  Created by meg on 12/19/22.
//

import Foundation
import FirebaseFirestore

struct Member: Identifiable, Codable {
    var documentID: String?
    var id: String
    
    init(id: String){
        self.id = id
    }
    init?(data: [String: Any], documentID: String) {
        guard let id = data["id"] as? String else {
            print("error initializing members")
            return nil
        }
        self.documentID = documentID
        self.id = id
    }
    func asDictonary() -> [String: Any] {
        return ["id": self.id]
    }
}
