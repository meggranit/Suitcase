//
//  TripViewModel.swift
//  Suitcase
//
//  Created by meg on 12/5/22.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore
import FirebaseCore
import SwiftUI
import FirebaseFirestoreSwift

class TripViewModel: ObservableObject {
    @Published private(set) var trips = [Trip]()
    let db = Firestore.firestore()
    
    init() {
        getTrips()
    }
    
    func getTrips() {
        db.collection("users/mWQXNGdncm2dpAzyQeUr/Trips").addSnapshotListener{ querySnapshot, error in
            guard let documents = querySnapshot?.documents else {
                print("error fetching documents: \(String(describing: error))")
                return
            }
            self.trips = documents.compactMap {
                document -> Trip? in
                do {
                    return try document.data(as: Trip.self)
                } catch {
                    print("error decoding document into trip: \(error)")
                    return nil
                }
            }
        }
    }
    
    func addTrip(tripName: String, location: String, startDate: Date, endDate: Date) {
        db.collection("users/mWQXNGdncm2dpAzyQeUr/Trips").addDocument(data: ["tripName": tripName, "location": location, "startDate": startDate, "endDate": endDate])
    }
    
    
    
    /*
    private var databaseReference = Firestore.firestore().collection("users/mWQXNGdncm2dpAzyQeUr/Trips") // reference to our Firestore's collection

    
    let auth = Auth.auth()
    let db = Firestore.firestore()
    
    //create
    func addTrip(tripName: String, location: String, startDate: Date, endDate: Date){
        db.collection("users/mWQXNGdncm2dpAzyQeUr/Trips").addDocument(data: ["tripName": tripName, "12/42" :location, "": startDate, "": endDate])
        
        
    }
    
    //read
    func readTrips() {
        db.collection("users/mWQXNGdncm2dpAzyQeUr/Trips").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    print("\(document.documentID) => \(document.data())")
                }
            }
        }
    }
    
    //update
    
    //delete
    */
}

