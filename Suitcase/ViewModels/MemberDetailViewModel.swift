//
//  MemberDetailViewModel.swift
//  Suitcase
//
//  Created by meg on 12/18/22.
//

import Foundation

class MemberDetailViewModel: ObservableObject {
    let memberm = UserModel.shared
    
    var selectedTrip: String
    
    init(selectedTrip: String) {
        self.selectedTrip = selectedTrip
        
    }
    
    
    
    func addMember(user: User, selectedTrip: String){
        memberm.addUserToTrip(user: user, docID: selectedTrip)
    }
    
    
}
