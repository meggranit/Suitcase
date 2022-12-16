//
//  PlansModel.swift
//  Suitcase
//
//  Created by meg on 12/5/22.
//

import Foundation
import Firebase
import FirebaseFirestore

struct Plans: Identifiable, Codable {
    var id: String
    var eventName: String
    var eventDescription: String
    var addedBy: String
    var startDate: Date
    var endDate: Date
    
}
