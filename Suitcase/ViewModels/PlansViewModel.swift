//
//  PlansViewModel.swift
//  Suitcase
//
//  Created by meg on 12/6/22.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore
import FirebaseCore
import FirebaseFirestoreSwift

class PlansViewModel: ObservableObject {
    @Published private(set) var plans: [Plans] = []
    let db = Firestore.firestore()
    
    init() {
        getPlans()
    }
    
    func getPlans() {
        db.collection("/users/mWQXNGdncm2dpAzyQeUr/Trips/hElJ2J8wxcXNZDiIHMLa/Plans").addSnapshotListener { querySnapshot, error in
            guard let documents = querySnapshot?.documents else {
                print("error fetching documents: \(String(describing: error))")
                return
            }
            self.plans = documents.compactMap { document -> Plans? in
                do {
                    return try document.data(as: Plans.self)
                } catch {
                    print("error decoding document into plans: \(error)")
                    return nil
                }
                
            }
        }
        
    }
    
    func addPlans(eventName: String, eventDescription: String, addedBy: String, startDate: Date, endDate: Date) {
        db.collection("users/mWQXNGdncm2dpAzyQeUr/Trips/hElJ2J8wxcXNZDiIHMLa/Plans").addDocument(data: ["eventName": eventName, "eventDescription": eventDescription, "addedBy": addedBy, "startDate": startDate, "endDate": endDate])
    }
}
