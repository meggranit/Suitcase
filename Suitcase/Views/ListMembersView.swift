//
//  ListMembersView.swift
//  Suitcase
//
//  Created by meg on 11/22/22.
//

import SwiftUI

struct ListMembersView: View {
    
    @ObservedObject var listmembersvm:  ListMembersViewModel
    @State var searchText = ""
    var trip: Trip
    
    init(trip: Trip){
        self.trip = trip
        listmembersvm = ListMembersViewModel(selectedTrip: trip.documentID!)
    }
    
    var body: some View {
        
        NavigationView{
            List(listmembersvm.filteredUsers, id: \.id) { user in
                NavigationLink(destination: MemberDetailView(user: user, trip: trip)) {
                    MemberRowView(thisUser: user)
                }
            }
            .listStyle(.plain)
            .navigationTitle("Members")
            .navigationBarHidden(false)
            
            .onChange(of: searchText) { searchText in
                
                if !searchText.isEmpty {
                    listmembersvm.filteredUsers = listmembersvm.users.filter {
                        $0.name.contains(searchText)
                    }
                } else {
                    listmembersvm.filteredUsers = listmembersvm.users
                }
            }
        }
        .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always))
    }
}

struct ListMembersView_Previews: PreviewProvider {
    static var previews: some View {
        ListMembersView(trip: Trip(id: "123", tripName: "name", longitude: "234", latitude: "123", startDate: "123", endDate: "123"))
    }
}
