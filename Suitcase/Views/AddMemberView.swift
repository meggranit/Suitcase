//
//  AddMemberView.swift
//  Suitcase
//
//  Created by meg on 11/22/22.
//

import SwiftUI

struct AddMemberView: View {
    @ObservedObject var userListVM: ListMembersViewModel
    @State var searchText = ""
    var trip: Trip
    
    init(trip: Trip){
        self.trip = trip
        userListVM = ListMembersViewModel(selectedTrip: trip.documentID!)
    }
    
    
    var body: some View {
        ScrollView{
            ForEach(userListVM.users, id: \.id) { user in
                MemberRowView(thisUser: user)
            }
        }
    }
}

struct AddMemberView_Previews: PreviewProvider {
    static var previews: some View {
        AddMemberView(trip: Trip(id: "123", tripName: "name", longitude: "123", latitude: "123", startDate: "123", endDate: "123"))
    }
}
