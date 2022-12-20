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
        VStack{
            NavigationLink {
                NewTripView(name: "", location: "", startDate: Date(), endDate: Date(), trip: Trip(id: "", tripName: "", longitude: "", latitude: "", startDate: "", endDate: ""))
                    .environmentObject(locationViewModel)
            } label: {
                Label("Add Trip", systemImage: "edit" )
                    .foregroundColor(Color.white)
                    .padding(.vertical, 10)
                    .padding(.horizontal, 20)
                
            }
            .background(Color(red: 0.4470588235294118, green: 0.5843137254901961, blue: 0.6))
            .cornerRadius(15)
            .padding()
            
            VStack {
                
                List($tripListVM.filteredTrips, id: \.id) {$trip in
                    NavigationLink(destination: SelectedTripView(trip: $trip)
                        .environmentObject(locationViewModel)) {
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
    
struct MyTripsView_Previews: PreviewProvider {
        static var previews: some View {
            MyTripsView()
    }
}

