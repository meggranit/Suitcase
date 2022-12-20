//
//  ChatModel.swift
//  Suitcase
//
//  Created by meg on 12/2/22.
//

import Foundation
import FirebaseFirestore
import FirebaseCore
import FirebaseAuth

let kChatInfoUpdated = "com.meghangranit.chatSUI.updated"

class ChatModel {
    
    static let shared = ChatModel()
    var userID: String = UserModel.shared.currentUserRef
    var tripID: String = TripModel.shared.currentTripRef
        
    
    // let fbFirestore = Firestore.firestore()
   // let queryCollection = Firestore.firestore().collection("users/\(userID)/Trips")
    var currentChatRef: String = ""
    var currentChat: Chat?
    
    var messages:[Chat] = []
    var messagesFiltered:[Chat] = []
    
    private init () {
    }
    /*
    func searchTrip (searchStr: String) -> Trip? {
        var trip: Trip?
        if let index = trips.firstIndex(where: {$0.tripName.caseInsensitiveCompare(searchStr) == .orderedSame}) {
            trip = trips[index]
        }
        return trip
    }
    
    
    func findChat (withID id: String, completionHandler: @escaping (Bool, Chat?) -> Void) {
        var chat: Chat?
        let docRef = Firestore.firestore().collection("users/\(userID)/Trips/\(tripID)/Chat").document(id)
        
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                if let aChat = Chat(data: document.data()!,documentID: document.documentID) {
                    chat = aChat
                    completionHandler(true, chat)
                }
                
            } else {
                print("Document does not exist")
                completionHandler(false, chat)
            }
        }
    }
    
    func updateTrip (trip: Trip) {
        print (trip)
        if let index = trips.firstIndex(where: {$0.id == trip.id}) {
            trips[index]  = trip
        }
        
        NotificationCenter.default.post(name: Notification.Name(rawValue: kTripInfoUpdated), object: self)
    }
    
    func getSearchedTrip(search: String) {
        tripsFiltered.removeAll()
        if search.count == 0 {
            tripsFiltered = trips
            return
        }
        tripsFiltered = trips.filter({
            $0.tripName.lowercased().contains(search.lowercased()) ||
            $0.id.contains(search)
        })
        
    }
    
    func getCurrentTrip (withID id: String) -> Trip {
        var trip: Trip!
        let docRef = Firestore.firestore().collection("users/\(userID)/Trips").document(id)

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
    
    
    func updateTripLocation (forTripID id: String, newLongitude longitude: String, newLatitude latitude: String) {
        if let index = trips.firstIndex(where: {$0.id == id}) {
            trips[index].longitude  = longitude
            trips[index].latitude = latitude
        }
        NotificationCenter.default.post(name: Notification.Name(rawValue: kTripInfoUpdated), object: self)
    }
    
    
     */
    func addChat(chat: Chat, docID: String) {
        print ("\(docID)")
        Firestore.firestore().collection("users/\(userID)/Trips/\(docID)/Chat").addDocument(data: chat.asDictionary()) {err in
            if let err = err {
                print ("error adding document \(err)")
            } else {
                print ("document added with \(docID)")
            }
            
        }
        
        
    }
    
   
    func updateChatDoc(chat: Chat, docID: String) {
        
        print ("\(docID)")
        Firestore.firestore().collection("users/\(userID)/Trips/\(tripID)/Chat").document(docID).setData(chat.asDictionary()) {err in
            if let err = err {
                print ("error adding document \(err)")
            } else {
                print ("document added with \(docID)")
            }
            
        }
        
        
    }
   
    
    
    func getAllMessages () {   // one time read
        self.messages = []
        self.messagesFiltered = []
        Firestore.firestore().collection("users/\(userID)/Trips/\(tripID)/Chat").getDocuments(){ (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    print("\(document.documentID) => \(document.data())")
                   
                    if let aChat = Chat(data: document.data(),documentID: document.documentID) {
                        self.messages.append(aChat)
                    }
                    
                    
                }
                self.messages.sort { $0.sentAt < $1.sentAt }
                self.messagesFiltered = self.messages
                
                NotificationCenter.default.post(name: Notification.Name(rawValue: kChatInfoUpdated), object: self)
            }
            
                        
        }
       
        
    }
    
    func observeAllMessages (selectedTrip: String) {
        print("DEBUG: running observerAllMessages()")
        Firestore.firestore().collection("users/\(userID)/Trips/\(selectedTrip)/Chat").addSnapshotListener { (querySnapshot, err) in
            
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                self.messages = []
                self.messagesFiltered = []
                for document in querySnapshot!.documents {
                    print("\(document.documentID) => \(document.data())")
                    if let aChat = Chat(data: document.data(), documentID: document.documentID) {
                        print (aChat)
                        self.messages.append(aChat)
                    }
                    
                    
                }
                self.messages.sort { $0.sentAt < $1.sentAt }
                self.messagesFiltered = self.messages
                print("Getting filtered messages: \(self.messagesFiltered)")
                NotificationCenter.default.post(name: Notification.Name(rawValue: kChatInfoUpdated), object: self)
                print("Getting messages: \(self.messages)")
            }
            
        }
       
    }
}

