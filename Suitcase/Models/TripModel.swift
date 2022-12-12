//
//  TripModel.swift
//  Suitcase
//
//  Created by meg on 12/5/22.
//

import Foundation

struct Trip: Identifiable, Codable {
    var id: String
    var tripName: String
    var location: String
    var startDate: Date
    var endDate: Date
}
