//
//  InvitedTripModel.swift
//  Suitcase
//
//  Created by meg on 12/20/22.
//

import Foundation
import FirebaseFirestore
import FirebaseCore
import FirebaseAuth

let kInvitedTripInfoUpdated = "com.meghangranit.invitedTripsSUI.updated"

class InvitedTripModel {
    static let shared = InvitedTripModel()
    var userID: String = UserModel.shared.currentUserRef
    
    var currentTripRef: String = ""
    var currentTrip: Trip?
    
    var invitedTrips:[Trip] = []
    var invitedTripsFiltered:[Trip] = []
    
    private init () {
    }
    
    func addTrip(invitedTrip: InvitedTrip) {
        print ("\(invitedTrip.userID)")
        Firestore.firestore().collection("users/\(invitedTrip.userID)/Trips").document(invitedTrip.id).setData(invitedTrip.asDictionary()) {err in
            if let err = err {
                print ("error adding document \(err)")
            } else {
                print ("document added with \(invitedTrip.id)")
            }
            
        }
        
        
    }
    
    func observeAllInvitedTrips () {
        
        Firestore.firestore().collection("users/\(userID)/InvitedTrips").addSnapshotListener { (querySnapshot, err) in
            
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                self.invitedTrips = []
                self.invitedTripsFiltered = []
                for document in querySnapshot!.documents {
                    print("\(document.documentID) => \(document.data())")
                    if let aInvitedTrip = InvitedTrip(data: document.data(), documentID: document.documentID) {
                        if let aTrip = self.findInvitedTrips(withID: aInvitedTrip.tripID, invitedUserID: aInvitedTrip.userID){
                            print (aTrip)
                            self.invitedTrips.append(aTrip)
                        }
                            
                        
                        
                    }
                    
                    
                }
                self.invitedTrips.sort {$0.startDate < $1.startDate}
                self.invitedTripsFiltered = self.invitedTrips
                print("Getting filtered trips: \(self.invitedTripsFiltered)")
                NotificationCenter.default.post(name: Notification.Name(rawValue: kInvitedTripInfoUpdated), object: self)
                print("Getting trips: \(self.invitedTrips)")
            }
        }
       
    }
    
    func findInvitedTrips (withID id: String, invitedUserID: String) -> Trip? {
        var trip: Trip!
        let docRef = Firestore.firestore().collection("users/\(invitedUserID)/Trips").document(id)

        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                if let aTrip = Trip(data: document.data()!,documentID: document.documentID) {
                    trip = aTrip
                    
                    
                }
                
            } else {
                print("Document does not exist")
            }
        }
        return trip
    }
    
}
