//
//  RegisterViewModel.swift
//  Suitcase
//
//  Created by meg on 12/15/22.
//

import Foundation

class RegisterViewModel: ObservableObject {
    @Published var message: String = "Enter Credentials"
    let umodel = UserModel.shared
    
    func registerNewUser(name: String, email: String, password: String) {
        print ("\(email) \(password)")
        let id = UUID.init().uuidString
        let newUser = User(id: id, name: name, email: email)
        umodel.registerUser(email: email, password: password, user: newUser) {
            result in
            if result {
                print ("added new user")
            } else {
                print ("failed")
            }
        }
    }
}
