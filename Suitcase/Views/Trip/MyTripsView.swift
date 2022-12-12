//
//  MyTripsView.swift
//  Suitcase
//
//  Created by meg on 11/22/22.
//

import SwiftUI

struct MyTripsView: View {
    @EnvironmentObject var userViewModel: UserViewModel
    @StateObject var tripViewModel = TripViewModel()
    
    var body: some View {
       
        //List (viewModel.trips, id: \.id ) trip in {
        VStack {
            NavigationStack{
                VStack{
                    NavigationLink {
                        NewTripView()
                    } label: {
                        Label("New Trip", systemImage: "plus")
                            .foregroundColor(Color.white)
                            .padding(.vertical, 10)
                            .padding(.horizontal, 20)
                    }
                    .background(Color(red: 0.4470588235294118, green: 0.5843137254901961, blue: 0.6))
                    .cornerRadius(15)
                    .padding()
                    ScrollView{
                        ForEach(tripViewModel.trips, id: \.id) { trip in
                            NavigationLink{
                                SelectedTripView()
                            } label: {
                                TripRowView(trip: trip)
                            }
                            
                        }
                    }
                    
                    
                }
                    .navigationTitle("My Trips")
                    .toolbar {
                        Button("Logout"){
                            userViewModel.signOut()
                        }
                        
                    }
            }
            /*
                TripRowView()
                TripRowView()
                TripRowView()
            
            Button(action: { userViewModel.signOut() }) {
                Text("Sign out")
                    .foregroundColor(Color.white)
                    .padding(.vertical, 10)
                    .padding(.horizontal, 20)
            } */
            Spacer()
            
        }
        // }
    }
}


struct MyTripsView_Previews: PreviewProvider {
    static var previews: some View {
        MyTripsView()
    }
}
