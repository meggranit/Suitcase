//
//  MyTripsView.swift
//  Suitcase
//
//  Created by meg on 11/22/22.
//

import SwiftUI

struct MyTripsView: View {
    @StateObject var locationViewModel = LocationViewModel()
    @ObservedObject var tripListVM = TripListViewModel()
    @ObservedObject var userVM = LoginViewModel()
    @State var searchText = ""
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        VStack {
            NavigationLink(destination: NewTripView(name: "", location: "", startDate: Date(), endDate: Date())
                .environmentObject(locationViewModel)) {
                Text("Add")
                
            }
            
                List($tripListVM.filteredTrips, id: \.id) {$trip in
                NavigationLink(destination: SelectedTripView(trip: $trip)) {
                    TripRowView(trip: $trip)
                }
            
            .listStyle(.plain)
            .navigationTitle("My Trips")
            .navigationBarHidden(false)
            
            .onChange(of: searchText) { searchText in
                
                if !searchText.isEmpty {
                    tripListVM.filteredTrips = tripListVM.trips.filter { $0.tripName.contains(searchText) }
                    } else {
                    tripListVM.filteredTrips = tripListVM.trips
                    }
                }
            }
            .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always))
            .toolbar {
                Button(action: { self.presentationMode.wrappedValue.dismiss() } ) {
                    Text("Logout")
                }

            }
           
        }
        
        
    }
       
}
    
struct MyTripsView_Previews: PreviewProvider {
        static var previews: some View {
            MyTripsView()
    }
}

