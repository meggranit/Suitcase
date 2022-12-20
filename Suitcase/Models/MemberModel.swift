//
//  MemberModel.swift
//  Suitcase
//
//  Created by meg on 12/19/22.
//

import Foundation
import FirebaseFirestore
import FirebaseCore
import FirebaseAuth

let kMemberInfoUpdated = "com.meghangranit.memberSUI.updated"

class MemberModel {
    static let shared = MemberModel()
    
    var userID: String = UserModel.shared.currentUserRef
    var currentMemberRef: String = ""
    var currentMember: User?
    
    var members: [User] = []
    
    private init(){
        
    }
    
    func observeAllMembers (selectedTrip: String) {
        Firestore.firestore().collection("users/\(userID)/Trips/\(selectedTrip)/Friends").addSnapshotListener { (querySnapshot, err) in
            
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                self.members = []
                for document in querySnapshot!.documents {
                    print("\(document.documentID) => \(document.data())")
                    if let aMember = User(data: document.data(), documentID: document.documentID) {
                        print (aMember)
                        self.members.append(aMember)
                    }
                    
                    
                }
                NotificationCenter.default.post(name: Notification.Name(rawValue: kMemberInfoUpdated), object: self)
               
            }
        }
       
    }
}
