//
//  TripListViewModel.swift
//  Suitcase
//
//  Created by meg on 12/15/22.
//

import Foundation

class TripListViewModel: ObservableObject {
    
    //var userModel = UserModel.shared
    var tripModel = TripModel.shared
    
    @Published var trips:[Trip] = []
    @Published var filteredTrips:[Trip] = []
    
    init() {
        trips = tripModel.trips
        filteredTrips = tripModel.trips
        tripModel.observeAllTrips()
        NotificationCenter.default.addObserver(self, selector: #selector(updateList), name: Notification.Name(kTripInfoUpdated), object: nil)
        
    }
    
    @objc
    
    func updateList() {
        trips = tripModel.trips
        filteredTrips = tripModel.trips
    }
    
}
