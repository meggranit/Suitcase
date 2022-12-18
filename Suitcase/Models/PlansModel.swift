//
//  PlansModel.swift
//  Suitcase
//
//  Created by meg on 12/5/22.
//

import Foundation
import FirebaseFirestore
import FirebaseCore
import FirebaseAuth


let kPlanInfoUpdated = "com.meghangranit.plansSUI.updated"

class PlansModel {
    
    static let shared = PlansModel()
    var userID: String = UserModel.shared.currentUserRef
    var tripID: String = TripModel.shared.currentTripRef
        
    
    // let fbFirestore = Firestore.firestore()
   // let queryCollection = Firestore.firestore().collection("users/\(userID)/Trips")
    var currentPlanRef: String = ""
    var currentPlan: Plan?
    
    var plans:[Plan] = []
    var plansFiltered:[Plan] = []
    
    private init () {
    }
    
    func searchPlan (searchStr: String) -> Plan? {
        var plan: Plan?
        if let index = plans.firstIndex(where: {$0.eventName.caseInsensitiveCompare(searchStr) == .orderedSame}) {
            plan = plans[index]
        }
        return plan
    }
    
    
    func findPlan (withID id: String, completionHandler: @escaping (Bool, Plan?) -> Void) {
        var plan: Plan?
        let docRef = Firestore.firestore().collection("users/\(userID)/Trips/\(tripID)/Plans").document(id)

        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                if let aPlan = Plan(data: document.data()!,documentID: document.documentID) {
                    plan = aPlan
                    completionHandler(true,plan)
                }
                
            } else {
                print("Document does not exist")
                completionHandler(false, plan)
            }
        }
    }
    
    func updatePlan (plan: Plan) {
        print (plan)
        if let index = plans.firstIndex(where: {$0.id == plan.id}) {
            plans[index]  = plan
        }
        
        NotificationCenter.default.post(name: Notification.Name(rawValue: kPlanInfoUpdated), object: self)
    }
    
    func getSearchedPlan(search: String) {
        plansFiltered.removeAll()
        if search.count == 0 {
            plansFiltered = plans
            return
        }
        plansFiltered = plans.filter({
            $0.eventName.lowercased().contains(search.lowercased()) ||
            $0.id.contains(search)
        })
        
    }
    
    func getCurrentPlan (withID id: String) -> Plan {
        var plan: Plan!
        let docRef = Firestore.firestore().collection("users/\(userID)/Trips/\(tripID)/Plans").document(id)

        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                if let aPlan = Plan(data: document.data()!,documentID: document.documentID) {
                    plan = aPlan
                }
                
            } else {
                print("Document does not exist")
            }
        }
        return plan
    }
    
    /*
    func updateTripLocation (forTripID id: String, newLongitude longitude: String, newLatitude latitude: String) {
        if let index = trips.firstIndex(where: {$0.id == id}) {
            trips[index].longitude  = longitude
            trips[index].latitude = latitude
        }
        NotificationCenter.default.post(name: Notification.Name(rawValue: kTripInfoUpdated), object: self)
    }
    */
    
  
    func addPlan(plan: Plan, docID: String) {
        print ("\(docID)")
        Firestore.firestore().collection("users/\(userID)/Trips/\(tripID)/Plans").document(docID).setData(plan.asDictionary()) {err in
            if let err = err {
                print ("error adding document \(err)")
            } else {
                print ("document added with \(docID)")
            }
            
        }
        
        
    }
    
   
    func updatePlanDoc(plan: Plan, docID: String) {
        
        print ("\(docID)")
        Firestore.firestore().collection("users/\(userID)/Trips/\(tripID)/Plans").document(docID).setData(plan.asDictionary()) {err in
            if let err = err {
                print ("error adding document \(err)")
            } else {
                print ("document added with \(docID)")
            }
            
        }
        
        
    }
   
    
    
    func getAllPlans () {   // one time read
        self.plans = []
        self.plansFiltered = []
        Firestore.firestore().collection("users/\(userID)/Trips/\(tripID)/Plans").getDocuments(){ (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    print("\(document.documentID) => \(document.data())")
                   
                    if let aPlan = Plan(data: document.data(),documentID: document.documentID) {
                        self.plans.append(aPlan)
                    }
                    
                    
                }
                self.plansFiltered = self.plans
                NotificationCenter.default.post(name: Notification.Name(rawValue: kPlanInfoUpdated), object: self)
            }
        }
       
        
    }
    
    func observeAllPlans () {
        
        Firestore.firestore().collection("users/\(userID)/Trips/\(tripID)/Plans").addSnapshotListener { (querySnapshot, err) in
     
            if let err = err {
                print("Error getting documents: \(err)")
   
            } else {
            
                self.plans = []
                self.plansFiltered = []
                for document in querySnapshot!.documents {
                    print("\(document.documentID) => \(document.data())")
                    if let aPlan = Plan(data: document.data(), documentID: document.documentID) {
                       
                        print (aPlan)
                        self.plans.append(aPlan)
                    }
                    
                    
                }
                self.plansFiltered = self.plans
                print("Getting filtered plans: \(self.plansFiltered)")
                NotificationCenter.default.post(name: Notification.Name(rawValue: kPlanInfoUpdated), object: self)
                print("Getting plans: \(self.plans)")
             
            }
        }
       
    }
}
