//
//  ListAddedMembersView.swift
//  Suitcase
//
//  Created by meg on 12/19/22.
//

import SwiftUI

struct ListAddedMembersView: View {
    
    @ObservedObject var listAddedMemberVM: ListAddedMembersViewModel
    var trip: Trip
    
    init(trip: Trip) {
        self.trip = trip
        listAddedMemberVM = ListAddedMembersViewModel(selectedTrip: trip.documentID!)
    }
    var body: some View {
        VStack {
            NavigationLink {
                ListMembersView(trip: trip)
            } label: {
                Label("Add Members", systemImage: "person" )
                    .foregroundColor(Color.white)
                    .padding(.vertical, 10)
                    .padding(.horizontal, 20)
                
            }
            .background(Color(red: 0.4470588235294118, green: 0.5843137254901961, blue: 0.6))
            .cornerRadius(15)
        .padding()
            ScrollViewReader { proxy in
                ScrollView {
                    ForEach( listAddedMemberVM.members, id: \.id) { member in
                        MemberRowView(thisUser: member)
                    }
                }
            }
        }
    }
}

struct ListAddedMembersView_Previews: PreviewProvider {
    static var previews: some View {
        ListAddedMembersView(trip: Trip(id: "123", tripName: "name", longitude: "123", latitude: "123", startDate: "123", endDate: "1234"))
    }
}
