//
//  NewTripViewModel.swift
//  Suitcase
//
//  Created by meg on 12/15/22.
//

import Foundation

class NewTripViewModel {
    let tripModel = TripModel.shared
    
    func addTrip(id: String, name: String, longitude: String,  latitude: String,  startDate: String, endDate: String, selectedTrip: String){
        let trip = Trip(id: id, tripName: name, longitude: longitude, latitude: latitude, startDate: startDate, endDate: endDate)
        tripModel.addTrip(trip: trip, docID: selectedTrip)
    }
    
    func findTrip(search: String) -> Trip? {
        return nil
    }
    
    func updateTrip(trip: Trip) {
        print("updateVM")
        tripModel.updateTrip(trip: trip)
    }
}
