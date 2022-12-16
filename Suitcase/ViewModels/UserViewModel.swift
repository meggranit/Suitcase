//
//  UserViewModel.swift
//  Suitcase
//
//  Created by meg on 11/22/22.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore
import FirebaseCore

let kUserInfoUpdated = "com.meghangranit.Suitcase.updated"

class UserViewModel: ObservableObject {
    let auth = Auth.auth()
    let db = Firestore.firestore()
    static var shared = UserViewModel()
    var currentUserID: String = "mWQXNGdncm2dpAzyQeUr"
    
    let queryCollection = Firestore.firestore().collection("users")
    
    var users:[User] = []
    var filteredUsers:[User] = []
    @Published var signedIn = false
    @Published var user = ""
    
    init() {
        observeAllUsers()
        let email = auth.currentUser?.email
        //currentUserID = getCurrentUserID(email: email!)
         
    }
    
    var isSignedIn: Bool {
        return auth.currentUser != nil
    }
    
    func signIn(email: String, password: String) {
        auth.signIn(withEmail: email, password: password) { [weak self] result, error in
            guard result != nil, error == nil else {
                return
            }
            
            DispatchQueue.main.async {
                //Success
                self?.signedIn = true
                self?.user = email
                //UserViewModel.shared.currentUserID = (self?.getCurrentUserID(email: email))!
                

            }
        }
        
        
    }
    func signUp(name: String, email: String, password: String) {
        auth.createUser(withEmail: email, password: password) { [weak self] result, error in
            guard result != nil, error == nil else {
                return
            }
            
            DispatchQueue.main.async {
                //Success
                self?.signedIn = true

            }
        }
        let newUser = User(id: UUID().uuidString, name: name, email: email)
        var ref: DocumentReference? = nil
        ref = queryCollection.addDocument(data: newUser.asDictionary()) {err in
            if let err = err {
                print ("error adding document \(err)")
            } else {
                print ("document added with \(ref!.documentID)")
                NotificationCenter.default.post(name: Notification.Name(rawValue: kUserInfoUpdated), object: self)
            }
            
        }
        //db.collection("users").addDocument(data: ["name": name, "email": email])
        
    }
    
    func signOut() {
        try? auth.signOut()
        
        self.signedIn = false
    }
    func observeAllUsers () {
        queryCollection.addSnapshotListener { (querySnapshot, err) in
           
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                self.users = []
                self.filteredUsers = []
                for document in querySnapshot!.documents {
                    print("\(document.documentID) => \(document.data())")
                   
                    if let aUser = User(data: document.data(), documentID: document.documentID) {
                        print (aUser)
                        self.users.append(aUser)
                    }
                    
                    
                }
                self.filteredUsers = self.users
                NotificationCenter.default.post(name: Notification.Name(rawValue: kUserInfoUpdated), object: self)
            }
        }
    }
    func getUsers() {
        db.collection("users").addSnapshotListener{ querySnapshot, error in
            guard let documents = querySnapshot?.documents else {
                print("error fetching documents: \(String(describing: error))")
                return
            }
            self.users = documents.compactMap {
                document -> User? in
                do {
                    return try document.data(as: User.self)
                } catch {
                    print("error decoding document into user: \(error)")
                    return nil
                }
            }
        }
        filteredUsers = users
    }
    /*
    func getCurrentUserID(email: String) -> String {
        
        let docRef = db.collection("users").document("\(email)")
        docRef.getDocument { (document, error) in
            guard error == nil else {
                print("error", error ?? "")
                return
            }
            if let document = document, document.exists {
                let data = document.data()
                if let data = data{
                    print("data", data)
                    self.user = data["id"] as? String ?? ""
                    
                }
            }
        }
        return docRef.path
     
        
    }
     */
    func findUser (withID id: String) -> User? {
        var user: User?
        
        if let index = users.firstIndex(where: {$0.id == id}) {
            user = users[index]
        }
        return user
    }
    /*
    func findUser(search: String) ->User? {
        var foundUser: User?
        if let index = users.firstIndex(where: {$0.name == search}) {
            foundUser = users[index]
        }
        return foundUser!
    }
    */
    func updateUser(user: User) {
        print("update view model")
        if let index = users.firstIndex(where: {$0.id == user.id}){
            users[index] = user
        }
    }
    func getSearchedUsers(search: String) {
        filteredUsers.removeAll()
        if search.count == 0 {
            filteredUsers = users
            return
        }
        filteredUsers = users.filter({
            $0.name.lowercased().contains(search.lowercased()) ||
            $0.email.lowercased().contains(search.lowercased()) ||
            $0.id.contains(search)
        })
        
    }
    
    func getAllUsers () {   // one time read
        self.users = []
        self.filteredUsers = []
        
        
        queryCollection.getDocuments(){ (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    print("\(document.documentID) => \(document.data())")
                   
                    if let aUser = User(data: document.data(),documentID: document.documentID) {
                        self.users.append(aUser)
                    }
                    
                    
                }
                self.filteredUsers = self.users
                NotificationCenter.default.post(name: Notification.Name(rawValue: kUserInfoUpdated), object: self)
            }
        }
       
        
    }
    func addUserToTrip(user: User) {
        return
    }
    
    
}
