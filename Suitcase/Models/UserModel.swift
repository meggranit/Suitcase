//
//  UserModel.swift
//  Suitcase
//
//  Created by meg on 12/10/22.
//

import Foundation
import FirebaseFirestore

struct User: Identifiable, Codable {
    var documentID: String?
    var id: String
    var name: String
    var email: String
    
    init(id:String, name: String, email: String){
        self.id = id
        self.name = name
        self.email = email
    }
    init?(data: [String: Any], documentID: String){
        guard let name = data["name"] as? String,
              let email = data["email"] as? String,
              let id = data["id"] as? String else {
            return nil
        }
        self.documentID = documentID
        self.name = name
        self.email = email
        self.id = id
    }
    func asDictionary() -> [String: Any] {
        return ["id" : self.id,
                "name": self.name,
                "email": self.email
        ]
    }
}
