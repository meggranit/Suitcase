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

class UserViewModel: ObservableObject {
    let auth = Auth.auth()
    let db = Firestore.firestore()
    
    @Published private(set) var users = [User]()
    @Published var signedIn = false
    @Published var user = ""
    
    init() {
        getUsers()
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
        db.collection("users").addDocument(data: ["name": name, "email": email])
        
    }
    
    func signOut() {
        try? auth.signOut()
        
        self.signedIn = false
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
    }
    
    func getCurrentUserID(email: String){
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
                    self.user = data["name"] as? String ?? ""
                }
            }
        }
        
    }
    
}
