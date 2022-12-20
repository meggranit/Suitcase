//
//  ListAddedMembersViewModel.swift
//  Suitcase
//
//  Created by meg on 12/19/22.
//

import Foundation

class ListAddedMembersViewModel: ObservableObject {
    var memberModel = MemberModel.shared
    var selectedTrip: String
    
    @Published var members: [User] = []
    
    init(selectedTrip: String){
        self.selectedTrip = selectedTrip
        members = memberModel.members
        memberModel.observeAllMembers(selectedTrip: selectedTrip)
        NotificationCenter.default.addObserver(self, selector: #selector(updateList), name: Notification.Name(kMemberInfoUpdated), object: nil)
        
    }
    
    @objc
    
    func updateList() {
        members = memberModel.members
    }
}
