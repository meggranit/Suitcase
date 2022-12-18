//
//  LoginViewModel.swift
//  Suitcase
//
//  Created by meg on 12/15/22.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var loggedIn = false
    let userModel = UserModel.shared
    
    var isSignedIn: Bool {
        print("is logged in")
        return userModel.auth.currentUser != nil
    }
    
    func loginUser (withEmail: String, password: String) {
        userModel.signIn(email: withEmail, password: password ){result in
            if result {
                print ("login successful")
                print (self.userModel.currentUserRef)
                print (self.userModel.currentUser)
                self.loggedIn = true
            } else {
                print ("login failed")
            }
        }
    }
    
    func logout () {
        try? userModel.auth.signOut()
        
        self.loggedIn = false
        print("logout successful")
        print(self.userModel.currentUserRef)
        
    }
}
