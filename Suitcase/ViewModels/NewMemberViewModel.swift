//
//  NewMemberViewModel.swift
//  Suitcase
//
//  Created by meg on 12/19/22.
//

import Foundation

class NewMemberViewModel {
    let userModel = UserModel.shared
    
    func addMember(user: User, selectedTrip: String) {
        userModel.addUserToTrip(user: user, docID: selectedTrip)
        
    }
}
