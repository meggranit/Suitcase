//
//  InvitedTripsListViewModel.swift
//  Suitcase
//
//  Created by meg on 12/20/22.
//

import Foundation

class InvitedTripListViewModel: ObservableObject {
    
    //var userModel = UserModel.shared
    var invitedTripModel = InvitedTripModel.shared
    
    @Published var invitedTrips:[Trip] = []
    @Published var filteredTrips:[Trip] = []
    
    init() {
        invitedTrips = invitedTripModel.invitedTrips
        filteredTrips = invitedTripModel.invitedTripsFiltered
        invitedTripModel.observeAllInvitedTrips()
        NotificationCenter.default.addObserver(self, selector: #selector(updateList), name: Notification.Name(kInvitedTripInfoUpdated), object: nil)
        
    }
    
    @objc
    
    func updateList() {
        invitedTrips = invitedTripModel.invitedTrips
        filteredTrips = invitedTripModel.invitedTrips
    }
    
}
