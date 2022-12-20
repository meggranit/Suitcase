//
//  InvitedTripsView.swift
//  Suitcase
//
//  Created by meg on 11/22/22.
//

import SwiftUI

struct InvitedTripsView: View {
    @StateObject var locationViewModel = LocationViewModel()
    @ObservedObject var invitedTripListVM = InvitedTripListViewModel()
    @ObservedObject var userVM = LoginViewModel()
    @State var searchText = ""
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        VStack{
            VStack {
                
                List($invitedTripListVM.filteredTrips, id: \.id) {$trip in
                    NavigationLink(destination: SelectedTripView(trip: $trip)
                        .environmentObject(locationViewModel)) {
                            TripRowView(trip: $trip)
                        }
                    
                        .listStyle(.plain)
                        .navigationTitle("My Trips")
                        .navigationBarHidden(false)
                    
                        .onChange(of: searchText) { searchText in
                            
                            if !searchText.isEmpty {
                                invitedTripListVM.filteredTrips = invitedTripListVM.invitedTrips.filter { $0.tripName.contains(searchText) }
                            } else {
                                invitedTripListVM.filteredTrips = invitedTripListVM.invitedTrips
                            }
                        }
                }
                .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always))
                .toolbar {
                    Button(action: {
                        userVM.logout()
                        self.presentationMode.wrappedValue.dismiss() } ) {
                        Text("Logout")
                    }
                    
                }
                
            }
            
        }
    }
}

struct InvitedTripsView_Previews: PreviewProvider {
    static var previews: some View {
        InvitedTripsView()
    }
}
