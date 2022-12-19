//
//  ListMembersViewModel.swift
//  Suitcase
//
//  Created by meg on 12/18/22.
//

import Foundation

class ListMembersViewModel: ObservableObject {
    var userModel = UserModel.shared
    
    @Published var users: [User] = []
    @Published var filteredUsers:[User] = []
    
    init() {
        users = userModel.users
        filteredUsers = userModel.users
        userModel.observeAllUsers()
        NotificationCenter.default.addObserver(self, selector: #selector(updateList), name: Notification.Name(kUserInfoUpdated), object: nil)
    }
    
    @objc
    
    func updateList() {
        users = userModel.users
        filteredUsers = userModel.users
    }
}

